class CreationsController < ApplicationController
  #def index
#	@creations = Creation.first
#	@id = @creations.creation_id
#	@pictures = Picture.where(creation_id: @id)
#  end
  def index
    @creations = Creation.all
    @sortCriteria = nil
    if params[:sort] != nil
      @sortCriteria = params[:sort]
    end
    if @sortCriteria == 'votes-rank'
      @creations = @creations.sort {|a,b| b.votes.count <=> a.votes.count}
    else
      @creations = @creations.sort {|a,b| b.created_at <=> a.created_at}
    end
  end
  
  def new
    @creation = Creation.new
  end
  
  def create
  	@creation = Creation.new(creation_params)
	@host = request.host
	@port = request.port
	if @port == 443
		@url = "https://"+@host
	else
		@url = "http://"+@host+":"+String(@port)
	end
    if !verify_recaptcha(model: @creation, private_key: "6LciMwUTAAAAAHFDUOFGVx58aY66C_Bw5FZQ6Yt7") 
      flash[:warning] = "The data you entered for the CAPTCHA wasn't correct.  Please try again"
      redirect_to new_creation_path
    elsif @creation.email != "" and not is_a_valid_email?(@creation.email)
		flash[:warning] = "Invalid email address.  Please input a valid email"
      	redirect_to new_creation_path
	else
      flash[:notice] = 'Creation was successfully uploaded and will be available for viewing once approved.'
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
      ManageMailer.email_to_manager(@creation,@url).deliver
	  if @creation.email != ""
	  	ManageMailer.email_to_user(@creation,"created",@url).deliver
	  end
    end
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
	@host = request.host
	@port = request.port
	@host = request.host
	@port = request.port
	if @port == 443
		@url = "https://"+@host
	else
		@url = "http://"+@host+":"+String(@port)
	end
	if @creation.email != ""
		ManageMailer.email_to_user(@creation,"accepted",@url).deliver
	end
	redirect_to creations_path
  end
 
  def delete
    @creation = Creation.find(params[:id])
    @creation.pictures.each do |picture|
		picture.image=nil
	end
	@creation.cover=nil
	@creation.save
	@creation.destroy
	@host = request.host
	@port = request.port
	@host = request.host
	@port = request.port
	if @port == 443
		@url = "https://"+@host
	else
		@url = "http://"+@host+":"+String(@port)
	end
    flash[:notice] = "Creation '#{@creation.name}' deleted."
	if @creation.email != ""
		ManageMailer.email_to_user(@creation,"rejected",@url).deliver
	end
    redirect_to creations_path
  end

  #def destroy
	#Creation.find(params[:id]).destroy
	#redirect_to(:action => 'index')
  #end

  def upvote
     flag = 0
     @creation = Creation.find(params[:id])
     @creation.votes.each do |v|
	if(v.vote_ip == request.remote_ip)
		flag = 1;
        end
     end
     if(flag == 0)
     	@creation.votes.create(vote_ip: request.remote_ip)
	flash[:notice] = 'Thanks for your voting!'
     else
        flash[:notice] = 'You have voted this creation!'
     end
     redirect_to creation_path(@creation)
  end
  
  private
  
  def creation_params
	params.require(:creation).permit(:name,:creator_name,:description,:likes,:email)
  end
 def is_a_valid_email?(email)
  email.match(/^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/i) != nil
 end
end
