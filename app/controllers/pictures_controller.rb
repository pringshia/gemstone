class PicturesController < ApplicationController

  def index
  	user = User.find(session[:user_id])
    @pictures = user.pictures

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end  

  def new
    @graph = Koala::Facebook::API.new(User.find(session[:user_id]).oauth_token)
    @albums = @graph.get_connections "me", "albums" 
    @picture = Picture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @picture = Picture.new(params[:picture])
    user = User.find(session[:user_id])
    user.pictures << @picture

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Picture was sucessfully saved.' }
        format.json { render json: @picture, status: :created, location: @picture }
      else
        format.html { render action: "new" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end
end
