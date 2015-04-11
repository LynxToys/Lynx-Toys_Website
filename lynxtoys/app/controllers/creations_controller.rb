class CreationsController < ApplicationController
  #def index
#	@creations = Creation.first
#	@id = @creations.creation_id
#	@pictures = Picture.where(creation_id: @id)
#  end
  def index
    @creations = Creation.all
  end
  
  def new
	@creation = Creation.new
  end
  
  def create
    @creation = Creation.new(creation_params)
    respond_to do |format|
	if @creation.save
		if params[:images]
	 	  params[:images].each { |image|
			@creation.pictures.create(image: image)
		  }
		end
		format.html { redirect_to @creation, notice: 'Greation was successfully created.' }
      		format.json { render json: @creation, status: :created, location: @creation }
	else
		format.html { render action: "new" }
	      #format.json { render json: @creation.errors, status: :unprocessable_entity }
	end
    end
  end
  
  def show
	@creation = Creation.find(params[:id])
  end
 
  def delete
	  @creation = Creation.find(params[:id])
    @creation.destroy
    flash[:notice] = "Creation '#{@creation.name}' deleted."
    redirect_to creations_path
  end

  #def destroy
	#Creation.find(params[:id]).destroy
	#redirect_to(:action => 'index')
  #end
  
  private
  
  def creation_params
	params.require(:creation).permit(:name,:creator_name,:description,:likes)
  end
end
