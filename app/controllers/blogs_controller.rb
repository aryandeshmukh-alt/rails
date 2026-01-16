class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :publish]

  # GET /blogs
  def index
    @blogs = Blog.published

    if params[:search].present?
      @blogs = @blogs.where("title LIKE ?", "%#{params[:search]}%")
    end
  end

  # GET /blogs/1
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to @blog, notice: "Blog was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blogs/1
  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: "Blog was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: "Blog was successfully destroyed."
  end

  # PATCH /blogs/1/publish
  def publish
    @blog.update(published: true)
    redirect_to @blog, notice: "Blog published successfully."
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
