require 'spec_helper'

describe PhotosController do

	it "should give exception if key is wrong" do
		FlickRaw.stub(:api_key).and_return("e8c48048d47b66acff93dbaa48f11fd")
		FlickRaw.stub(:shared_secret).and_return("b578612f092ab5ab")
		get :show, {"search_term" => "lucky"}
		flash[:error].should == "Authentication Failed: 'flickr.reflection.getMethods' - Invalid API Key (Key has invalid format)"
	end

	it "should give congiguration error if key is not defined" do
		FlickRaw.stub(:api_key).and_return(nil)
		FlickRaw.stub(:shared_secret).and_return(nil)
		get :show, {"search_term" => "lucky"}
		flash[:error].should == "Some thing went wrong: No API key or secret defined!"
	end

  it "return zero results if no items found for search term" do
  	get :show, {"search_term" => "noresultstest"}
  	assigns(:photos).count.should == 0
  end

  it "return results if items found for search term" do
  	get :show, {"search_term" => "lucky"}
  	assigns(:photos).count.should > 0
  end

end

