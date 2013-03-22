module Problem
  class Interactive < Base
    def number_of_horses
      @number_of_horses ||= ask("How many horses should race?  ", Integer) do |q|
        q.default = 25
      end
    end

    def number_of_lanes
      @number_of_lanes ||= ask("How spots are there on the track?  ", Integer) do |q|
        q.default = 5
      end
    end

    def number_of_winners
      @number_of_winners ||= ask("How many winners are we looking for? ", Integer) do |q|
        q.default = 3
      end
    end

    def solution_klass
      @klass ||= choose do |menu|
        menu.index        = :number
        menu.index_suffix = ": "

        menu.prompt = "Choose solution strategy  "

        menu.choice 'Base Case' do
          ::Solution::BaseCase 
        end
        menu.choice 'QuickR' do
          ::Solution::QuickR
        end
      end
    end
  end
end

