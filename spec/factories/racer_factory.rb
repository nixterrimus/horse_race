FactoryGirl.define do
  factory :racer, aliases: [:horse] do
    name        "John"
    sequence(:bib_number) {|n| n }
    speed { rand(1000) }
  end
end
