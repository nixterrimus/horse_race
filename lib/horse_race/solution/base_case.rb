module Solution
  class BaseCase
    attr_reader :number_of_tries, :horses

    def initialize(horses)
      @horses = horses
      @number_of_tries = 0
    end

    def run_race(horses)
      @number_of_tries+=1
      race = Race.new(horses)
      race.perform
      race.results
    end

    # With a track size of 5 and 3 possible winners
    # Race 5 horses, take the top 3
    # While there are still unraced horses
    #   Race previous top 3 + 2 more horses
    # The top 3 from the last race are the real top 3
    def perform(track_size=5, number_of_winners=3)
      raise "Number of Winers must be less than or equal to track size" if number_of_winners > track_size
      horses_for_this_race = horses.unraced(track_size)
      results = run_race(horses_for_this_race)
      while(horses.unraced.count > 0)
        run_again = results.slice(0, number_of_winners)
        additional_needed = track_size - run_again.count
        additional_horses = horses.unraced(additional_needed)
        horses_for_this_race = run_again + additional_horses
        results = run_race(horses_for_this_race)
      end
      results.take(number_of_winners)
    end
  end
end
