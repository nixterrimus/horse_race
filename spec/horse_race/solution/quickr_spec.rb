require 'spec_helper'

describe Solution::QuickR do
  let(:horses) { FactoryGirl.build :horses }
  subject { Solution::QuickR.new(horses) }
  let(:track_size) { 5 }
  let(:number_of_winners) { 3 }

  it 'returns the horses in the correct order' do
    solution = horses.sort_by(&:speed).take(number_of_winners)
    expect(subject.perform(track_size, number_of_winners)).to eql(solution)
  end
end
