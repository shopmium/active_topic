# frozen_string_literal: true

require 'active_topic'
require 'active_topic/class_methods'

RSpec.describe ActiveTopic::ClassMethods do
  let(:dummy_class) { Class.new { extend ActiveTopic::ClassMethods } }

  describe '.with_project_id' do
    it 'sets the instance variable project_id attribute to the provided value' do
      dummy_class.with_project_id('test')

      expect(dummy_class.instance_variable_get(:@project_id)).to eq('test')
    end
  end

  describe '.with_credentials' do
    it 'sets the instance variable credentials attribute to the provided value' do
      dummy_class.with_credentials('test')

      expect(dummy_class.instance_variable_get(:@credentials)).to eq('test')
    end
  end

  describe '.project_id' do
    before(:all) { ActiveTopic.project_id = 'lolo' }

    context 'when project_id class attribute is not set' do
      it 'returns ActiveTopic.project_id' do
        expect(dummy_class.project_id).to eq('lolo')
      end
    end

    context 'when project_id class attribute set' do
      it 'returns the class project_id class attribute' do
        dummy_class.with_project_id('lala')

        expect(dummy_class.project_id).to eq('lala')
      end
    end
  end

  describe '.credentials' do
    before(:all) { ActiveTopic.credentials = 'lolo' }

    context 'when credentials class attribute is not set' do
      it 'returns ActiveTopic.credentials' do
        expect(dummy_class.credentials).to eq('lolo')
      end
    end

    context 'when credentials class attribute set' do
      it 'returns ActiveTopic.credentials' do
        dummy_class.with_credentials('lala')

        expect(dummy_class.credentials).to eq('lala')
      end
    end
  end
end
