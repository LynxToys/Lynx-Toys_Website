class CreationsController < ApplicationController
  def index
    @creations = Creation.all
  end
  
  def new
	@creation = Creation.new
  end
  
  def create
    @creation = Creation.new(creation_params)
    if @creation.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end
  
  def show
	@creation = Creation.find(params[:id])
  end
  
  private
  
  def creation_params
	params.require(:creation).permit(:name)
  end
end
