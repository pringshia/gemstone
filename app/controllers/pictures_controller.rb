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
    @user = User.find(session[:user_id])
    @comments = Comment.find(:all, :conditions => ["picture_id = ?", params[:id]])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end  

  def new
    @graph = Koala::Facebook::API.new(current_user.oauth_token)
    if (params[:album])
      @pictures = @graph.get_connections params[:album], "photos"
    else
      @albums = @graph.get_connections "me", "albums" 
    end
    @picture = Picture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @picture = Picture.new(link: params[:link])
    user = User.find(session[:user_id])
    user.pictures << @picture

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Picture was sucessfully saved.' }
        format.json { render json: @picture, status: :created, location: @picture }
      else
        format.html { redirect_to @picture, flash: {error: @picture.errors.full_messages.to_sentence}  }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def retrieve
    @picture = Picture.find(params[:pic_id][:id])
    @user = User.find(session[:user_id])
    if @user.tokens > 0
      @user.decrement!(:tokens)
      comment = Comment.find_redeem_comment @picture
      Comment.update(comment[0].id, :redeemed => true)
      comment[0].save
    end
    @comments = Comment.find(:all, :conditions => ["picture_id = ?", @picture.id])
    render :controller => "pictures", :action => "show"

  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.comments.clear
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end
end
