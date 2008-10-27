require 'rubygems'
require 'active_support'
require File.join(File.dirname(__FILE__), '..', 'lib', 'acts_as_configurable')

class MockActiveRecord
  include RPH::ActsAsConfigurable
end

class Settings1 < MockActiveRecord
  acts_as_configurable
  
  configuration do |config|
    config.users.subdomains = 10
    config.users.passwords.attempts = 3
  end
end

class Settings2 < MockActiveRecord
  acts_as_configurable
  
  configuration do |config|
    config.users.subdomains = 15
    config.users.passwords.attempts = 5
  end
end

class Settings3 < MockActiveRecord
  acts_as_configurable :with => :configurator
  
  configurator do |config|
    config.cache_location = '/some/path'
  end
end

class Settings4 < MockActiveRecord
  acts_as_configurable :with => :configurator
  
  configurator do |config|
    config.cache_location = '/other/path'
  end
end


class Blank < MockActiveRecord
  acts_as_configurable
end