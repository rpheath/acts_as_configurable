require 'rubygems'
require 'active_support'
require File.join(File.dirname(__FILE__), '..', 'lib', 'acts_as_configurable')

Object.send :include, RPH::ActsAsConfigurable

class Settings1
  acts_as_configurable
  
  configuration do |config|
    config.users.subdomains = 10
    config.users.passwords.attempts = 3
  end
end

class Settings2
  acts_as_configurable
  
  configuration do |config|
    config.users.subdomains = 15
    config.users.passwords.attempts = 5
  end
end

class Settings3
  acts_as_configurable :with => :configurator
  
  configurator do |config|
    config.cache_location = '/some/path'
  end
end

class Settings4
  acts_as_configurable :with => :configurator
  
  configurator do |config|
    config.cache_location = '/other/path'
  end
end


class Blank
  acts_as_configurable
end