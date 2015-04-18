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
    if !verify_recaptcha(model: @creation, private_key: "6LciMwUTAAAAAHFDUOFGVx58aY66C_Bw5FZQ6Yt7") 
      flash[:warning] = "The data you entered for the CAPTCHA wasn't correct.  Please try again"
      redirect_to new_creation_path
    else
      flash[:notice] = 'Creation was successfully created.'
      respond_to do |format|
      	if @creation.save
      		if params[:images]
      	 	  params[:images].each { |image|
      			@creation.pictures.create(image: image)
      		  }
      		end
      		#@creation.cover.create(cover: params[:cover])
      		@cover = Cover.new
      		@cover.cover=params[:cover]
      		@cover.creation_id=@creation.id
      		@cover.save
      		format.html { redirect_to @creation }
          format.json { render json: @creation, status: :created, location: @creation }
      	else
      		format.html { render action: "new" }
      	      #format.json { render json: @creation.errors, status: :unprocessable_entity }
      	end
      end
    end
	ManageMailer.sample_email.deliver
  end
  
  def show
	@creation = Creation.find(params[:id])
  end

  def manage
	@creation = Creation.find(params[:id])
  end
  
  def accept
	@creation = Creation.find(params[:id])
	@creation.isAc = 1
	@creation.save
	redirect_to creations_path
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
