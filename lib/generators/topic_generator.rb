# frozen_string_literal: true

require 'rails/generators'

module ActiveTopic
  module Generators
    class TopicGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      def create_topic
        template 'topic.erb', "app/topics/#{file_name}_topic.rb"
      end
    end
  end
end
