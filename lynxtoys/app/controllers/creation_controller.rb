class CreationController < ApplicationController
  def index
	@creations = Creation.first
	@id = @creations.creation_id
	@pictures = Picture.where(creation_id: @id)
  end
end
