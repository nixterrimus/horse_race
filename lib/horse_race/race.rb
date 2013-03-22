class Race
  attr_reader :contestants, :completed, :done
  def initialize(contestants)
    @contestants = contestants
    @done = false
    @results = []
  end

  def perform
    raise "Race has already been run" if done
    @results = contestants.sort_by(&:speed)
    record_constants_raced
    @done = true
  end

  # returns a ranked array of the winning contestants
  def results
    ensure_race_has_been_run
    @results
  end

  def winner
    results.first
  end

  private

  def ensure_race_has_been_run
    raise "Race hasn't been run yet!" unless done
  end

  def record_constants_raced
    contestants.each(&:raced)
  end
end
