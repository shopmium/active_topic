# frozen_string_literal: true

module ActiveTopic
  module ClassMethods
    def with_project_id(project_id)
      @project_id = project_id.to_s
    end

    def with_credentials(credentials)
      @credentials = credentials.to_s
    end

    def project_id
      @project_id || ActiveTopic.project_id
    end

    def credentials
      @credentials || ActiveTopic.credentials
    end
  end
end
