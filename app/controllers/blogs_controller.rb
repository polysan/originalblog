class BlogsController < ApplicationController
  def index
    @blogs = blog.all
  end

def new
  @blog = Blog.new
end



end
