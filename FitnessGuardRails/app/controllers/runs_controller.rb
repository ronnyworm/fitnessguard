class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy]

  http_basic_authenticate_with name: "ronny", password: "bangbangbang", except: [:index, :show, :compact, :tracks]

  # GET /runs
  def index
    @runs = Run.order("date DESC")
  end

  def compact
    @runs = Run.order("date DESC")
  end

  def tracks
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

    respond_to do |format|
      if @run.save
        format.html { redirect_to @run, notice: 'Run was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /runs/1
  def update
    respond_to do |format|
      if @run.update(run_params)
        format.html { redirect_to @run, notice: 'Run was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /runs/1
  def destroy
    @run.destroy
    respond_to do |format|
      format.html { redirect_to runs_url, notice: 'Run was successfully destroyed.' }
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
