require 'spec_helper'

describe ApplicationController do

  describe "route generation" do
    it "should be correct routing for root" do                                                                                                           
      { :get => "/" }.should route_to(:controller => "forums", :action => "index")
    end 
  end 
end
