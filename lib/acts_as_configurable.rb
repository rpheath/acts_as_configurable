%w(error configuration).each do |f|
  require File.join(File.dirname(__FILE__), 'acts_as_configurable', f)
end

module RPH
  module ActsAsConfigurable
    def self.included(receiver)
      receiver.extend ActMethods
    end
    
    module ActMethods
      # Example
      # class API < ActiveRecord::Base
      #   acts_as_configurable
      # end
      def acts_as_configurable(options = {})
        options = {
          :with => 'configuration'
        }.merge!(options)
        
        class_inheritable_accessor :options
        extend ClassMethods
        
        self.options = options
      end
    end
  
    module ClassMethods
      # shortcut for accessing the configuration
      def method_missing(name, &block)
        return Configuration.config(self.to_s, &block) if name.to_sym == options[:with].to_sym
        super
      end
    end
  end
end