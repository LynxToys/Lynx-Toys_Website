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
    captcha_message = "The data you entered for the CAPTCHA wasn't correct.  Please try again"
    if !verify_recaptcha(model: @creation, message: captcha_message, private_key: "6LciMwUTAAAAAHFDUOFGVx58aY66C_Bw5FZQ6Yt7") 
      render "new"
    else
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
