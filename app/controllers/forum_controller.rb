class ForumController < ApplicationController
  def index
    @forums = Forum.all
  end
  def new
    @forum = Forum.new
  end
  def create
    @forum = current_user.forums.build(forum_params)
    if @forum.save
      redirect_to forum_path(@forum), notice: "Forum created successfully."
    else
      render :new
    end
  end
  def show
    @forum = Forum.find_by(id: params[:id])
    if @forum.nil?
      redirect_to forums_path, alert: "Forum not found."
    else
      @comment = Comment.new
    end
  end
  def create_comment
    @forum = Forum.find_by(id: params[:forum_id])
    if @forum.nil?
      redirect_to forums_path, alert: "Forum not found."
      return
    end
    @comment = @forum.comments.build(comment_params.merge(user: current_user))
    if @comment.save
      redirect_to forum_path(@forum), notice: "Comment posted successfully."
    else
      render :show
    end
  end
  def destroy
    @forum = Forum.find_by(id: params[:forum_id])
    if @forum.nil?
      redirect_to forums_path, alert: "Forum not found."
      return
    end
    if authorized_to_delete?(@forum)
      @forum.destroy
      redirect_to forums_path, notice: "Forum deleted successfully."
    else
      redirect_to forum_path(@forum), alert: "You are not authorized to delete this forum."
    end
  end
  def destroy_comment
    @comment = Comment.find_by(id: params[:comment_id])
    if @comment.nil?
      redirect_to forums_path, alert: "Comment not found."
      return
    end
    if authorized_to_delete?(@comment)
      @comment.destroy
      redirect_to forum_path(@comment.forum), notice: "Comment deleted successfully."
    else
      redirect_to forum_path(@comment.forum), alert: "You are not authorized to delete this comment."
    end
  end

  private
  def forum_params
    params.require(:forum).permit(:title, :content)
  end
  def comment_params
    params.require(:comment).permit(:content)
  end
  def authorized_to_delete?(resource)
    resource.user == current_user || current_user.username == "Toprun123"
  end
end
