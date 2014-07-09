class PhotosController < ApplicationController
	config.relative_url_root = ""
	require 'flickraw'
  def index
   render
  end
 
  def show
   begin
		FlickRaw.api_key= "e8c48048d47b66acff93dbaa48f11fde"
		FlickRaw.shared_secret= "b578612f092ab5ab"
		search_term = params[:search_term]
		@photos = flickr.photos.search(:user_id => '126019493@N02', :text => search_term.to_s)
	 rescue FlickRaw::FailedResponse => e
	 	flash[:error] = "Authentication Failed: #{e.message}"
	 rescue Exception => e
	 	flash[:error] = "Some thing went wrong: #{e.message}"
	 end
  end

end


