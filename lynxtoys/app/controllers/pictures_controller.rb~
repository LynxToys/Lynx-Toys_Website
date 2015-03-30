class PicturesController < ApplicationController
  def index
	@pictures = Picture.find_by_sql("SELECT * FROM pictures")
  end
end
