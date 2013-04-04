class BlogsController < ApplicationController
  before_filter :authenticate_admin!, except: [:index, :show]
  def create
    @blog = Blog.new(params[:blog])
    if @blog.save
      redirect_to root_path, notice: "created blog successfully"
    else
      @errors = @blog.errors.full_messages
      render :new
    end
  end

  def create_comment
    @blog = Blog.find(params[:id])
    if @blog.update_attributes params[:blog]
      redirect_to blog_path(@blog)
    else
      flash[:notice] = @blog.errors.full_messages.join(", ")
      render :show
    end
  end

  def destroy
    @blog = Blog.find params[:id]
    @blog.destroy
    redirect_to root_path, notice: "deleted blog successfully"
  end
  
  def edit
    @blog = Blog.find params[:id]
  end

  def index
    @blogs = Blog.all
    @un_published_blogs = Blog.un_published
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find params[:id]
  end

  def update
    @blog = Blog.find params[:id]
    if @blog.update_attributes(params[:blog])
      redirect_to root_path, notice: "updated blog successfully"
    else
      @errors = @blog.errors.full_messages
      render :edit
    end
  end

end
