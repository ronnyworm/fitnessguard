class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:index, :show, :stats]

  # GET /runs
  def index
    @runs = Run.order("date DESC")
  end

  def stats
    @runs = Run.order("date DESC")

    @people = ["Marcus", "Tobias", "Ronny"]

    runs_hash = Hash.new
    count = 0
    @people.each do |p|
      runs_hash[p] = Hash.new

      if params["show_#{p.downcase}"]
        count += 1
      end
    end

    if count == 0
      @people.each do |p|
        params["show_#{p.downcase}"] = true
      end
    end


    if browser.mobile?
      month_limit = 2.month
    else
      if params[:month_limit].blank?
        month_limit = 12.month
      else
        month_limit = (params[:month_limit].to_i - 1).month
      end
    end

    @runs.each do |run|
      next if run.date.strftime("%Y-%m") < (Date.today - month_limit).strftime("%Y-%m")

      @people.each do |p|
        if params["show_#{p.downcase}"] and run.participants.include? p
          runs_hash[p].store(run.date, run.power)
        end
      end
    end

    @runner_chart = Array.new
    @people.each do |p|
      tmp = Hash.new
      tmp["name"] = p
      tmp["data"] = runs_hash[p]

      @runner_chart.push(tmp)
    end
  end

  # GET /runs/1
  def show
  end

  # GET /runs/new
  def new
    @run = Run.new
  end

  # GET /runs/1/edit
  def edit
  end

  # POST /runs
  def create
    @run = Run.new(run_params)

    @run[:user_id] = current_user.id

    respond_to do |format|
      if @run.save
        format.html { redirect_to @run, notice: 'Lauf wurde angelegt' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /runs/1
  def update
    respond_to do |format|
      if @run.update(run_params)
        format.html { redirect_to @run, notice: 'Lauf wurde geändert' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /runs/1
  def destroy
    @run.destroy
    respond_to do |format|
      format.html { redirect_to runs_url, notice: 'Lauf wurde gelöscht' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run
      @run = Run.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def run_params
      params.require(:run).permit(:date, :participants, :km, :duration, :max_pulse, :comments, :map_link, :km_10, :duration_mmss)
    end
end
