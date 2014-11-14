class TurnController < ApplicationController
  def next
    current_city_turn = City.where(owner_id: current_user).first.turn
    current_city_turn.turn_number += 1
    current_city_turn.save!
    redirect_to "/"
  end
end
