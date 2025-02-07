class Api::V1::BlogsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  protect_from_forgery with: :null_session, if: -> { request.format.json? }

  def index
    blogs = Blog.all
    render json: blogs, status: 200
  end

  def show
    blog = Blog.find_by(id: params[:id])
    if blog
      render json: blog, status: 200
    else
      render json:{
        error: "Blog not found"
      }
    end
  end

  def create
    blog= Blog.new(
      title: blog_params[:title],
      content:  blog_params[:content]
    )
    if blog.save
        render json: blog, status: 200
    else
       render json: {
        error: "Error..!!!"
       }
    end
  end

  def update
    blog = Blog.find_by(id: params[:id])
    if blog
      blog.update(title: params[:title], content: params[:content])
      render json: "Blog updated succesfully"
    else
      render json: {
        error: "Error.....!!!!!"
      }
    end
  end

  def destroy
    blog = Blog.find_by(id: params[:id])
    if blog
      blog.destroy
      render json: "Blog has been deleted"
    end
  end

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    blog = Blog.find(params[:id])
  end
end