require 'spec_helper'

describe Racer do
  subject { Racer.new }
  describe 'raced' do
    it 'increments the race count' do
      expect{subject.raced}.to change{subject.race_count}.by(1)
    end
  end

  describe 'unraced' do
    context 'race_count is 0' do
      it 'returns true' do
        subject.stub(:race_count).and_return(0)
        expect(subject.unraced?).to eql(true)
      end
    end
    context 'race_count is not 0' do
      it 'returns false' do
        subject.stub(:race_count).and_return(1)
        expect(subject.unraced?).to eql(false)
      end
    end
  end
end
