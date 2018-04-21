class PoisController < ApplicationController
  before_action :set_poi, only: [:show, :edit, :update, :destroy]

  # GET /pois
  # GET /pois.json
  def index
    @pois = if params[:l]
      sw_lat, sw_lng, ne_lat, ne_lng = params[:l].split(",")
      Poi.search("*", page: params[:page], per_page: 4, where: {
        location: {
          top_left: {
            lat: ne_lat,
            lon: sw_lng
          },
          bottom_right: {
            lat: sw_lat,
            lon: ne_lng
          }
        }
      })
    elsif params[:q]
      location = Geocoder.search(params[:q]).first
      Poi.search(
        params.fetch(:q, "*"), 
        fields: [:name, :string, :address, :near, :categories],
        page: params[:page], per_page: 4
 

         # @pois = Poi.search(params[:q]), fields: [:name], page: params[:page], per_page = 1
     
        # boost_by_distance: {location: {origin: {lat: location.latitude, lon: location.longitude}}},
        # where: {
        #   location: {
        #     near: {
        #       lat: location.latitude,
        #       lon: location.longitude
        #     },
        #     within: "5mi"
        #   }
        # }
        )
    # elsif params[:near]
    #   #Transaction.near(params[:near]).page(params[:page]).per(5)
    #   location = Geocoder.search(params[:near]).first
    #   Poi.search "*", page: params[:page], per_page: 2,
    #     boost_by_distance: {location: {origin: {lat: location.latitude, lon: location.longitude}}},
    #     where: {
    #       location: {
    #         near: {
    #           lat: location.latitude,
    #           lon: location.longitude
    #         },
    #         within: "5mi"
    #       }
    #     }
    else
      Poi.all.page(params[:page]).per(8)
    end
  end

  # GET /pois/1
  # GET /pois/1.json
  def show
  end

  # GET /pois/new
  def new
    @poi = Poi.new
  end

  # GET /pois/1/edit
  def edit
  end

  # POST /pois
  # POST /pois.json
  def create
    @poi = Poi.new(poi_params)
    respond_to do |format|
      if @poi.save
        format.html { redirect_to @poi, notice: 'Poi was successfully created.' }
        format.json { render :show, status: :created, location: @poi }
      else
        format.html { render :new }
        format.json { render json: @poi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pois/1
  # PATCH/PUT /pois/1.json
  def update
    respond_to do |format|
      if @poi.update(poi_params)
        format.html { redirect_to @poi, notice: 'Poi was successfully updated.' }
        format.json { render :show, status: :ok, location: @poi }
      else
        format.html { render :edit }
        format.json { render json: @poi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pois/1
  # DELETE /pois/1.json
  def destroy
    @poi.destroy
    respond_to do |format|
      format.html { redirect_to pois_url, notice: 'Poi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poi
      @poi = Poi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poi_params
      params.require(:poi).permit(:name, :string, :onCallout, :address, :latitude, :longitude, :avatar, category_ids:[], tour_ids:[], group_ids:[], landmark_ids:[])
    end
end
