class CitySociety < ActiveRecord::Base
  WORKER_GATHER_RATE_FOOD = 2.0
  WORKER_GATHER_RATE_WOOD = 0.4
  WORKER_GATHER_RATE_STONE = 0.1

  validate :worker_count_bigger_than_citizen_count
  validate :worker_count_non_negative

  def daily_food_gather
    food_workers * WORKER_GATHER_RATE_FOOD
  end

  def daily_wood_gather
    wood_workers * WORKER_GATHER_RATE_WOOD
  end

  def daily_stone_gather
    stone_workers * WORKER_GATHER_RATE_STONE
  end

  def idle_workers
    citizens - (workers_sum)
  end

  def workers_sum
    food_workers + stone_workers + wood_workers
  end

  def worker_count_bigger_than_citizen_count
    if workers_sum > citizens
      errors.add(:citizens, "Workers count cannot be greater than citizen count")
    end
  end

  def worker_count_non_negative
    if food_workers < 0 or stone_workers < 0 or wood_workers < 0
      errors.add(:citizens, "Worker count can't be negative")
    end
  end
end
