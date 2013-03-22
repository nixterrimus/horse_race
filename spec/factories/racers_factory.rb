FactoryGirl.define do
  horses = 25.times.collect { FactoryGirl.build :horse }
  factory :racers, aliases: [:horses] do
    initialize_with { new(horses) }
  end
end
