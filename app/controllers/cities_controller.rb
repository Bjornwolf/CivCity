class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @cities = City.all
    respond_with(@cities)
  end

  def show
    respond_with(@city)
  end

  def new
    @city = City.new
    respond_with(@city)
  end

  def edit
  end

  def create
    params = city_params
    params[:owner_id] = current_user.id
    @city = City.new(params)

    @city.city_resource = CityResource.new
    @city.city_society   = CitySociety.new
    @city.turn = Turn.create

    @city.save!
    redirect_to '/'
  end

  def update
    params = city_params
    params[:owner_id] = current_user.id
    @city.update(city_params)
    respond_with(@city)
  end

  def destroy
    @city.destroy
    respond_with(@city)
  end

  def current
    respond_with current_city_query.()
  end

  private
    def current_city_query
      Cities::CurrentUserCityQuery.new(current_user)
    end

    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name, :owner_id)
    end
end
