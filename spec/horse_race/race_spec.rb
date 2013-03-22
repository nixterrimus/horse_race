require 'spec_helper'

describe Race do
  let(:racer) { Racer.new }
  let(:racers) { Racers.new([ racer ]) }
  subject { Race.new( racers ) }
  describe "initialization" do
    it 'requires a set of contestants' do
      expect { Race.new }.to raise_error
    end
    it 'sets done to false' do
      expect(subject.done).to eql(false)
    end
  end

  describe 'results' do
    context 'the race has not been run' do
      it 'raises an error' do
        subject.stub(:done).and_return(false)
        expect { subject.results }.to raise_error
      end
    end
    context 'the race has been run' do
      it 'returns an array of results' do
        subject.stub(:done).and_return(true)
        expect( subject.results.class ).to eql(Array)
      end
    end
  end

  describe 'perform' do
    context 'the race has not been run yet' do
      it 'ranks the contestants' do
        racers.each { |r| r.should_receive(:speed) }
        subject.perform
      end
      it 'notifies the racers they raced' do
        racers.each { |r| r.should_receive(:raced) }
        subject.perform
      end
      it 'sets done' do
        subject.perform
        expect(subject.done).to eql(true)
      end
    end
  end
end
