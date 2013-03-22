module Problem
  class Base
    def number_of_horses
      25
    end

    def number_of_lanes
      5
    end

    def number_of_winners
      3
    end

    def horses
      @horses ||= Racers.new( create_horses(number_of_horses) )
    end

    def solution
      @solution ||= solution_klass.new( horses )
    end

    def solution_results
      @results ||= solution.perform(number_of_lanes, number_of_winners)
    end

    def solution_klass
      ::Solution::BaseCase
    end

    def success?
      solution_results == computed_solution
    end

    def solution_summary
      str = "\nWith the #{solution_klass} Strategy\n"
      str+= "Solution succeeded? #{success?}\n"
      str+= "#{number_of_horses} raced on a #{number_of_lanes} laned track\n"
      str+= "The top #{number_of_winners} horses are: \n"
      solution_results.each do |horse|
        str += "  - #{horse.name} #{horse.bib_number}  \n"
      end
      str+= "This was computed in #{solution.number_of_tries} races"
      str
    end

    private

    def computed_solution
      horses.sort_by(&:speed).take(number_of_winners)
    end

    def create_horses(number_of_horses)
      (1..number_of_horses).collect do |n|
        speed = rand(n*100)
        params = { speed: speed, bib_number: n }
        Racer.new( params )
      end
    end
  end
end
