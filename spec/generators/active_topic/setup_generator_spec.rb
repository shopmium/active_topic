# frozen_string_literal: true

require 'generators/active_topic/setup_generator'
require 'generator_spec'

RSpec.describe ActiveTopic::Generators::SetupGenerator, type: :generator do
  destination File.expand_path('../../../tmp', __dir__)

  before(:all) { prepare_destination }

  let(:file_content) do
    <<~FILE
      # frozen_string_literal: true

      ActiveTopic.configure do |config|
        config.project_id = 'Your Google Cloud project id'
        config.credentials = 'Your Google Cloud credentials'
      end
    FILE
  end

  it 'creates the configuration file config/initializers/active_topic.rb' do
    run_generator

    assert_file('config/initializers/active_topic.rb', file_content)
  end
end
