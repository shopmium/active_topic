# frozen_string_literal: true

require 'active_topic'

RSpec.describe ActiveTopic do
  it 'has a version number' do
    expect(ActiveTopic::VERSION).not_to be nil
  end

  describe '.configure' do
    it 'yields itself' do
      expect { |c| described_class.configure(&c) }.to yield_with_args described_class
    end
  end
end
