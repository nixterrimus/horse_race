module Solution
  class QuickR
    attr_reader :number_of_tries, :horses

    def initialize(horses)
      @horses = horses
      @number_of_tries = 0
    end

    def run_race(horses)
      @number_of_tries+=1
      race = Race.new(horses)
      race.perform
      race
    end

    # How can this work to get an answer faster?
    def perform(track_size=5, number_of_winners=3)
    end

  end
end
