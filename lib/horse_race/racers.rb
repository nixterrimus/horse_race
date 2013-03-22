class Racers
  include Enumerable
  attr_reader :racer_instances

  def initialize(racers=[])
    @racer_instances = racers
  end

  def each(&block)
    @racer_instances.each(&block)
  end

  def unraced(number_to_get=nil)
    number_to_get ||= count
    racer_instances.select(&:unraced?).take(number_to_get)
  end

  def where_race_count(number)
    racer_instances.select { |racer| racer.race_count == number }
  end
end
