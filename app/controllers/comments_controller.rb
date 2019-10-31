class CommentsController < ApplicationController
  before_action :authenticate_user

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id 
    @comment.gossip_id = params[:gossip_id]
    if @comment.save
      flash[:success] = "Commentaire ajouté"
      redirect_to gossip_path(@comment.gossip)
    else 
      render
    end 
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params 
    params.required(:comment).permit(:content)
  end 

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte toi pour pouvoir commenter"
      redirect_to new_session_path
    end
  end

end
