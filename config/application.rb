require_relative 'boot'

require 'rails/all'

require_relative '../app/core_extensions/nil_class.rb'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tarottechno
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Central Time (US & Canada)'
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.autoload_paths << Rails.root.join('spec', 'fabricators')
    config.autoload_paths << Rails.root.join('app', 'uploaders')
  end
end
