module Cities
  class CurrentUserCityQuery
    def initialize(actor)
      @actor = actor
    end

    def call
      City.where(owner_id: actor.id).first
    end

    private
    attr_reader :actor
  end
end