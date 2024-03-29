class CommentsController < ApplicationController

  def new
    @picture = Picture.find_best_for current_user
    if @picture.empty?
      # throw "No picture to comment on. Either there are no other users, or other users haven't uploaded pictures."
      flash.keep[:notice] = "No picture to comment on. Either there are no other users, or other users haven't uploaded pictures."
      redirect_to :controller => 'pictures', :action => 'index'
    else
      @comment = Comment.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @comment }
      end
    end
  end

  def mine
      @comments = Comment.where("user_id = ?", session[:user_id]).order("created_at DESC")
      render "mine" 
  end

  def create
    @comment = Comment.new(params[:comment])
    user = User.find(session[:user_id])
    picture = Picture.find(params[:pic_id][:id])
    
    if Comment.find(:all, :conditions => ['user_id = ? AND picture_id = ?', session[:user_id], params[:pic_id][:id]]).empty?    
      picture.comments << @comment
      user.comments << @comment
    end

    respond_to do |format|
      if @comment.save
        flash.keep[:notice] = "Comment was successfully created"
        format.html { redirect_to :controller => 'users', :action => 'index'}
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_to new_comment_path, flash: {error: @comment.errors.full_messages.to_sentence}  }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

end
