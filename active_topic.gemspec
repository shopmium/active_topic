# frozen_string_literal: true

require_relative 'lib/active_topic/version'

Gem::Specification.new do |spec|
  spec.name          = 'active_topic'
  spec.version       = ActiveTopic::VERSION
  spec.authors       = ['Sacha Arroche']
  spec.email         = ['arroche.sacha@gmail.com']

  spec.summary       = 'Create your own topics to publish messages on Google Cloud Pub/Sub!'
  spec.description   = 'Simplify the publication of messages on Google Cloud Pub/Sub Topics.'
  spec.homepage      = 'https://shopmium.com'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/shopmium/active_topic'
  spec.metadata['changelog_uri'] = 'https://github.com/shopmium/active_topic/blob/master/CHANGELOG.md'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'generator_spec', '~> 0.9.4'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
