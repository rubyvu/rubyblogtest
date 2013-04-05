class Api::BlogsController < Api::BaseController
	before_filter :authenticate_user!, only: [:create_comment]
  def create_comment
    hash = {}
    if params[:content].blank?
      hash = {status: 200, message: "content can't be blank."}
    else
      blog = Blog.where(id: params[:id]).first
      unless blog
        hash = {status: 205, message: "The blog with id #{params[:id]} could not be found"}
      else
        blog.comments.create(user_id: @current_user.id, content: params[:content])
        hash = {status: 200, message: "comment is created successfully"}
      end
    end
    render json: hash
  end

  def index
    blogs = Blog.published
    blogs_arr = []
    blogs.each do |blog|
      blogs_arr << {id: blog.id, title: blog.title}
    end
    hash = {
              status: 200,
              blogs: blogs_arr
    }
    render json: hash
  end

  def show
    blog = Blog.where(id: params[:id]).first
    hash = {}
    unless blog
      hash = {status: 205, message: "The blog with id #{params[:id]} could not be found"}
    else 
      comments = []
      blog.comments.each do |comment|
        posted_by = comment.user ? comment.user.email : "guest"
        comments << {content: comment.content, posted_by: posted_by}
      end

      hash = {status: 200, blog: {id: blog.id, title: blog.title, content: blog.content, comments: comments}}
    end
    render json: hash
  end

end
