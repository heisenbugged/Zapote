require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "rails/test_unit/railtie"

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module EnglishQuiz
  class Application < Rails::Application
    config.action_view.javascript_expansions[:defaults] = %w(jquery rails)
    config.generators do |g|
              g.orm :mongoid
              g.template_engine :haml
    end
    config.encoding = "utf-8"
    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]
    ### Part of a Spork hack. See http://bit.ly/arY19y
    if Rails.env.test?
      initializer :after => :initialize_dependency_mechanism do
        # Work around initializer in railties/lib/rails/application/bootstrap.rb
        ActiveSupport::Dependencies.mechanism = :load
      end
    end
  end
end
