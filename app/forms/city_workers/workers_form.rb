module CityWorkers
  class WorkersForm
    ValidationError = Class.new(StandardError)

    include ActiveModel::Conversion
    include ActiveModel::Validations
    include Virtus.model

    attribute :food_workers, Integer
    attribute :wood_workers, Integer
    attribute :stone_workers, Integer

    validates :food_workers, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :wood_workers, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :stone_workers, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    def persisted?
      false
    end

    def validate!
      raise ValidationError, errors unless valid?
    end
  end
end