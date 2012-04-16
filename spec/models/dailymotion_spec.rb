require 'spec_helper'

describe Dailymotion do

  it "can be instantiated only once" do
    instance = Dailymotion.new
    
    instance.should be_an_instance_of(Dailymotion)
    instance.should == Dailymotion.new
    instance.should == Dailymotion.get_instance

    Dailymotion.count.should == 1
  end

  it "can be saved successfully" do
    instance = Dailymotion.get_instance
    instance.refresh_token = "blablabla"
    instance.save.should == true

    Dailymotion.new.refresh_token.should == "blablabla"
  end

  it "can store the refresh_token" do
    refresh_token = Dailymotion.get_refresh_token
    refresh_token.should be_nil

    refresh_token = "hellotoken"
    Dailymotion.save_refresh_token refresh_token

    refresh_token = Dailymotion.get_refresh_token
    refresh_token.should == "hellotoken"
  end

end