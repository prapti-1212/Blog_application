class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  def index
    @blogs = Blog.all
  end

  def my_blogs
    @blogs = current_user.blogs
  end

  def show
  end

  def new
    @blog = current_user.blogs.new
  end

  def create
    @blog = current_user.blogs.new(blog_params)
    if @blog.save
      redirect_to @blog, notice: "Blog was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # No update logic here, just fetching the blog for editing
  end

  def update
    if @blog.update(blog_params)
      redirect_to blog_path, notice: "Blog was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog.destroy
    redirect_to my_page_index_path, notice: "Blog was successfully deleted."
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def authorize_user!
    unless @blog.user == current_user
      redirect_to blogs_path, alert: "You are not authorized to edit this blog."
    end
  end
end
