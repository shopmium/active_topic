# frozen_string_literal: true

require 'active_topic/class_methods'
require 'active_topic/exceptions'
require 'google/cloud/pubsub'
require 'rails'

module ActiveTopic
  class Base
    extend ClassMethods

    delegate :publish, :publish_async, :subscribe, to: :topic

    def initialize
      if self.class == ActiveTopic::Base
        raise ActiveTopic::Exceptions::CantBeIniatilized, 'ActiveTopic::Base cannot be initialized'
      end

      super
    end

    def create_topic!
      pubsub.create_topic(topic_name)
    end

    protected

    def topic_name
      @topic_name ||= self.class.to_s.sub(/Topic\z/, '').underscore
    end

    def topic
      @topic ||= pubsub.topic(topic_name)

      raise ActiveTopic::Exceptions::TopicNotFound, topic_name unless @topic

      @topic
    end

    def pubsub
      @pubsub ||= Google::Cloud::PubSub.new(
        project_id: self.class.project_id,
        credentials: self.class.credentials
      )
    end
  end
end
