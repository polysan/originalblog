class BlogsController < ApplicationController
  def index
    @blogs = Blog.order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
  end

private
  def blog_params
    params.require(:blog).permit(:title,:text)
  end


end
