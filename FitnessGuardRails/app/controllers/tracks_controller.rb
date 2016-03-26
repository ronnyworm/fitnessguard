class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:index]

  # GET /tracks
  def index
    @regions = Region.all
  end

  # GET /tracks/new
  def new
    @track = Track.new
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks
  def create
    @track = Track.new(track_params)

    sp = StartingPoint.find_by(name: params[:starting_point_name].split(" - ")[1])
    unless sp.nil?
      @track[:starting_point_id] = sp.id 
    end

    respond_to do |format|
      if @track.save
        format.html { redirect_to tracks_url, notice: 'Track was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /tracks/1
  def update
    sp = StartingPoint.find_by(name: params[:starting_point_name].split(" - ")[1])
    if sp.nil?
      @track[:starting_point_id] = nil
    else
      @track[:starting_point_id] = sp.id
    end

    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to tracks_url, notice: 'Track was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /tracks/1
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: 'Track was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:starting_point_id, :name, :night_track, :map_link, :km, :comments)
    end
end
