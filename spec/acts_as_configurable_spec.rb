require File.join(File.dirname(__FILE__), 'spec_helper')

describe "ActsAsConfigurable" do
  it "should return empty Hash configuration" do
    Blank.configuration.is_a?(Hash).should be_true
    Blank.configuration.should == {}
  end
  
  # proves that configuration can work for
  # multiple classes using the standard settings
  describe "standard configuration" do
    it "should respond to 'configuration'" do
      Settings1.configuration.should_not be_nil
      Settings2.configuration.should_not be_nil
    end
  
    it "should return a Hash" do
      Settings1.configuration.is_a?(Hash).should be_true
      Settings2.configuration.is_a?(Hash).should be_true
    end
    
    it "should return the hash of values for passwords" do
      Settings1.configuration.users.passwords.is_a?(Hash).should be_true
      Settings2.configuration.users.passwords.is_a?(Hash).should be_true
    end
    
    it "should return two different ranges for each class" do
      Settings1.configuration.users.subdomains.should == 10
      Settings2.configuration.users.subdomains.should == 15
    end
    
    it "should return two different values for password attempts" do
      Settings1.configuration.users.passwords.attempts.should == 3
      Settings2.configuration.users.passwords.attempts.should == 5
    end
  end
  
  # proves that the configuration can handle a custom
  # 'configuration' method, as well as that the values
  # stored are exclusive to the class they represent
  describe "custom configuration" do
    it "should return a hash based on the custom configurator method" do
      Settings3.configurator.is_a?(Hash).should be_true
      Settings4.configurator.is_a?(Hash).should be_true
    end
    
    it "should return the correct values for each custom class" do
      Settings3.configurator.cache_location.should == '/some/path'
      Settings4.configurator.cache_location.should == '/other/path'
    end
  end
end