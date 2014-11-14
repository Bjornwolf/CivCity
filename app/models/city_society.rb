class CitySociety < ActiveRecord::Base
  validate :worker_count_bigger_than_citizen_count
  validate :worker_count_non_negative

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
