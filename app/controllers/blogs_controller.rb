class BlogsController < ApplicationController
  def index
    @blogs = blog.all
  end


end
