# error module to raise plugin specific errors
module RPH
  module ActsAsConfigurable
    module Error
      class CustomError < RuntimeError
        def self.message(msg=nil); msg.nil? ? @message : self.message = msg; end
        def self.message=(msg); @message = msg; end
      end
    end
  end
end