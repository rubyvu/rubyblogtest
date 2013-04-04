class HomeController < ApplicationController
  def index
  	@blogs = Blog.published
    @un_published_blogs = Blog.un_published
  end
end
