class Racer
  attr_accessor :name, :speed, :race_count, :bib_number
  def initialize(params={})
    @name = params.fetch(:name, "Ed")
    @speed = params.fetch(:speed, 0)
    @race_count = 0
    @bib_number = params.fetch(:bib_number, 1)
  end

  def raced
    @race_count+= 1
  end

  def unraced?
    race_count == 0
  end
end
