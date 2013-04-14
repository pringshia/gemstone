class RatingsController < ApplicationController

  def new
    @comment = Comment.find_best_for current_user
    if @comment.empty?
      flash.keep[:notice] = "There are currently no comments to rate. Please proceed to commenting on a picture."
      redirect_to :controller => 'comments', :action => 'new'
    elsif (@comment[0].picture_id.nil?)
      @comment[0].destroy
      redirect_to controller: 'ratings', action: 'new'
    else
      @picture = Picture.find(@comment[0].picture_id)
      @rating = Rating.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @rating }
      end
    end
  end

  def create
    @rating = Rating.new(params[:rating])
    user = User.find(session[:user_id])
    comment = Comment.find(params[:com_id][:id])
    comment.ratings << @rating
    user.ratings << @rating
    User.update_tokens @rating

    respond_to do |format|
      if @rating.save
        format.html { redirect_to :controller => 'comments', :action => 'new'}
        format.json { render json: @rating, status: :created, location: @rating }
      else
        format.html { render action: "new" }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end
end
