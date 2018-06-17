class BlogsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @blogs = Blog.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy if blog.user_id == current_user.id
  end

 def show
    @blog =  Blog.find(params[:id])
    @comment = Comment.new
    # @comment = @blog.comments.includes(:user)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
    end
  end


private
  def blog_params
    params.require(:blog).permit(:title,:text).merge(user_id: current_user.id)
  end

  def move_to_index
  redirect_to action: :index unless user_signed_in?
  end

end
