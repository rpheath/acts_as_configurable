# error module to raise plugin specific errors
module RPH
  module ActsAsConfigurable
    module Error
      class ActsAsConfigurableError < RuntimeError
        def self.message(msg=nil); msg.nil? ? @message : self.message = msg; end
        def self.message=(msg); @message = msg; end
      end
      
      # plugin errors would go here
      # 
      # Example:
      #   InvalidConfiguration < ActsAsConfigurableError
      #     message "You have supplied invalid configuration" end
    end
  end
end