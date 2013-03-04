class CommentsController < ApplicationController

  def new
    @picture = Picture.find_best_for current_user
    if @picture.empty?
      throw "No picture to comment on. Either there are no other users, or other users haven't uploaded pictures."
    else
      @comment = Comment.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @comment }
      end
    end
  end

  def create
    @comment = Comment.new(params[:comment])
    user = User.find(session[:user_id])
    picture = Picture.find(params[:pic_id][:id])
    picture.comments << @comment
    picture.increment!(:num_comments)
    user.comments << @comment

    respond_to do |format|
      if @comment.save
        flash.keep[:notice] = "Comment was successfully created"
        format.html { redirect_to :controller => 'users', :action => 'index'}
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

end
