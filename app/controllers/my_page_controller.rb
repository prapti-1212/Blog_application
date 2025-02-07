class MyPageController < ApplicationController
  def index
    @blogs  = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to @blog
    else
      render :new
    end
  end
  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    if @blog.update(blog_params)
      respond_to do |format|
        format.html { redirect_to @blog, notice: "Blog was successfully updated." }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@blog) }
      end
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to my_page_index_path
  end

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  private

    def set_blog
      @blog = Blog.find(params[:id])
    end
end
