class PicturesController < ApplicationController

  def index
  	user = User.find(session[:user_id])
    @pictures = user.pictures.order("created_at")    
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @picture = Picture.find(params[:id])
    @user = User.find(session[:user_id])
    @comments = Comment.find(:all, :conditions => ["picture_id = ? AND redeemed = ?", params[:id], true], :order => "comments.updated_at ASC")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end  

  def new
    @graph = Koala::Facebook::API.new(current_user.oauth_token)
    if (params[:album] || params[:page])
      @pictures = params[:page] ? @graph.get_page(params[:page]) : @graph.get_connections(params[:album], "photos")
      # @pictures = @graph.get_connections params[:album], "photos"
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
        format.html { redirect_to @picture, notice: 'Picture was successfully saved.' }
        format.json { render json: @picture, status: :created, location: @picture }
      else
        format.html { redirect_to new_picture_path, flash: {error: @picture.errors.full_messages.to_sentence}  }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def retrieve
    @picture = Picture.find(params[:id])
    @user = User.find(session[:user_id])
    if @user.tokens > 0 && @picture.unredeemed_count > 0
      @user.decrement!(:tokens)
      Comment.redeem_comment @picture
    end
    redirect_to :controller => "pictures", :action => "show", :id => params[:id]
  end

  def caption
    @picture = Picture.find(params[:pic_id][:id])
    @picture.update_attribute("caption", params[:caption][:caption_text])
    redirect_to :controller => "pictures", :action => "show", :id => params[:pic_id][:id]
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
