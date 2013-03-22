require 'spec_helper'

describe Racers do
  subject { FactoryGirl.build :racers }

  describe "unraced" do
    before do
      Racer.any_instance.stub(:unraced).and_return(true)
    end
    context 'with a number to get' do
      it 'returns a limited number of unraced racers' do
        expect(subject.unraced(3).count).to eql(3)
      end
    end
    context 'with no paramaters' do
      it 'returns all unraced racers' do
        expect(subject.unraced.count).to eql(subject.count)
      end
    end
  end

  describe "where_race_count" do
    let(:target) { 9 }
    before do
      Racer.any_instance.stub(:race_count).and_return(target)
    end

    it 'returns the number of racers with the desired race count' do 
      expect(subject.where_race_count(target).count).to eql(subject.count)
    end
  end
end
