module CityWorkers
  class WorkersController < ApplicationController
    def update
      form = CityWorkers::WorkersForm.new(params[:workers])
      result = update_service.(form)
      render json: result
    end

    private
    def update_service
      Update.new(current_user)
    end
  end
end