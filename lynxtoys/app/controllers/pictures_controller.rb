class PicturesController < ApplicationController
  def index
	@pictures = Picture.find_by_sql("SELECT * FROM pictures")
  end
  def new
	@picture = Picture.new
  end
  #def create
#	@picture = Picture.new(picture_params)
 # end
end
