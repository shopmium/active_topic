# frozen_string_literal: true

require 'active_topic/version'
require 'active_topic/base'
require 'active_topic/class_methods'
require 'active_topic/exceptions'
require 'rails'

module ActiveTopic
  mattr_accessor :project_id
  mattr_accessor :credentials

  def self.configure
    yield(self)
  end
end
