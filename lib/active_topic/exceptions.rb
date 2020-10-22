# frozen_string_literal: true

module ActiveTopic
  module Exceptions
    class Base < StandardError; end

    class TopicNotFound < Base; end

    class CantBeIniatilized < Base; end
  end
end
