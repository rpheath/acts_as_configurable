%w(error configuration).each do |f|
  require File.join(File.dirname(__FILE__), 'acts_as_configurable', f)
end

# dynamic configuration/settings storage
# for models or classes
module RPH
  module ActsAsConfigurable
    def self.included(receiver)
      receiver.extend ActMethods
    end
    
    module ActMethods
      # Examples:
      #   class API
      #     acts_as_configurable
      #     
      #     configuration do |config|
      #       config.key = '123456'
      #       config.user_id = '0001'
      #     end
      #   end
      #   
      #   $> API.configuration.key      # => '123456'
      #   $> API.configuration.user_id  # => '0001'
      #
      #   class API
      #     acts_as_configurable :with => :settings
      #
      #     settings do |setting|
      #       setting.key = '123456'
      #       setting.user_id = '0001'
      #     end
      #   end
      #
      #   $> API.settings.key       # => '123456'
      #   $> API.settings.user_id   # => '0001'
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
      # if the missing method matches the configuration
      # method, return the configuration for that class;
      # otherwise, call super to handle normal behavior
      def method_missing(name, &block)
        return Configuration.config(self.to_s, &block) if name.to_sym == options[:with].to_sym
        super
      end
    end
  end
end