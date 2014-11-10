class DashboardController < ApplicationController

  respond_to :html

  def index
    render "index", locals: { has_city: has_current_user_city? }
  end

  private
  def has_current_user_city?
    City.where(owner_id: current_user.id).count != 0
  end
end
