class CommentsController < ApplicationController
before_action :set_comment
# def new
#   @blog = Blog.find(params[:blog_id])
#   @comment =

def create
  @comment = Comment.create(comment_params)

end

private
def comment_params
  params.require(:comment).permit(:text).merge(user_id: current_user.id, blog_id: params[:blog_id])
# end                     blog_idはcommentの中に入っていないのでpermitの中に入れても習得できないためmergeで習得する

def set_comment
  @blog = Blog.find(params[:blog_id])
end

end
