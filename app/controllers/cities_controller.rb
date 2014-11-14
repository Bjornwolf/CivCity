class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  respond_to :html

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
    @city.turn = Turn.create
    @city.city_society = CitySociety.new
    @city.save
    respond_with(@city)
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

  private
    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name, :owner_id)
    end
end
