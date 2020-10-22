# frozen_string_literal: true

require 'generator_spec'
require 'generators/topic_generator'

RSpec.describe ActiveTopic::Generators::TopicGenerator, type: :generator do
  destination File.expand_path('../../tmp', __dir__)

  before(:all) { prepare_destination }

  it 'creates a new topic under app/topics folder' do
    run_generator %w[lala]

    assert_file('app/topics/lala_topic.rb', /class LalaTopic < ActiveTopic::Base/)
  end
end
