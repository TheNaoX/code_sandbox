require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Assets should be precompiled for production (so we don't need the gems loaded then)
Bundler.require(*Rails.groups(assets: %w(development test)))

module EmberjsExample
  class Application < Rails::Application

    # Use haml as template generator by default
    config.generators do |g|
      g.template_engine :haml
    end

  end
end
