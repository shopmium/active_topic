# frozen_string_literal: true

require 'rails/generators'

module ActiveTopic
  module Generators
    class SetupGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def create_active_topic_config_file
        copy_file 'setup.rb', 'config/initializers/active_topic.rb'
      end
    end
  end
end
