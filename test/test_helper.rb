if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!
end

require 'simplecov'
ENV["RAILS_ENV"] = "test"
SimpleCov.start('rails') if ENV["COVERAGE"]

require File.expand_path('../../config/environment', __FILE__)
require 'mocha/setup'
require 'rails/test_help'
require 'factory_girl'
FactoryGirl.reload

class ActiveSupport::TestCase
  include AuthHelper
  include Devise::TestHelpers
  include FactoryGirl::Syntax::Methods
end
