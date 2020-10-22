# frozen_string_literal: true

require 'active_topic/base'

RSpec.describe ActiveTopic::Base do
  before(:all) { class DummyClassTopic < ActiveTopic::Base; end }
  subject { DummyClassTopic.new }

  describe '.initialize' do
    context 'when class is ActiveTopic::Base' do
      it 'raises an error' do
        expect { ActiveTopic::Base.new }.to raise_error(ActiveTopic::Exceptions::CantBeIniatilized)
      end
    end

    context 'when class is deriving from ActiveTopic::Base' do
      it 'instantiates a new instance' do
        expect(DummyClassTopic.new).to be_a(DummyClassTopic)
      end
    end
  end

  describe '#create_topic!' do
    it 'creates a topic with the class name in snake_case and without the Topic word at the end' do
      allow_any_instance_of(ActiveTopic::Base).to(receive(:pubsub))
                                              .and_return(Google::Cloud::PubSub::Project.new('dummy'))
      expect_any_instance_of(Google::Cloud::PubSub::Project).to receive(:create_topic).with('dummy_class')

      subject.create_topic!
    end
  end
end
