class TurnController < ApplicationController
  def next
    workers_gather_resources
    change_turn
    redirect_to "/"
  end

  private
  def workers_gather_resources
    current_city_resources.food += current_city_society.daily_food_gather
    current_city_resources.wood += current_city_society.daily_wood_gather
    current_city_resources.stone += current_city_society.daily_stone_gather
    current_city_resources.save!
  end

  def change_turn
    turn = current_city.turn
    turn.turn_number += 1
    turn.save!
  end

  def current_city
    @city ||= City.where(owner_id: current_user.id).first
  end

  def current_city_resources
    current_city.city_resource
  end

  def current_city_society
    current_city.city_society
  end
end
