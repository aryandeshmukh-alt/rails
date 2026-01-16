class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :publish]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  PER_PAGE = 5

  def index
    page = params[:page].to_i
    page = 1 if page < 1

    @blogs = Blog.published
    @blogs = @blogs.where("title LIKE ?", "%#{params[:search]}%") if params[:search].present?
    @blogs = @blogs.offset((page - 1) * PER_PAGE).limit(PER_PAGE)

    respond_to do |format|
      format.html
      format.json { render json: @blogs }
    end

    @current_page = page
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @blog }
    end
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to @blog, notice: "Blog was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: "Blog was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: "Blog was successfully destroyed."
  end

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

  def record_not_found
    respond_to do |format|
      format.html { redirect_to blogs_path, alert: "Blog not found." }
      format.json { render json: { error: "Blog not found" }, status: :not_found }
    end
  end
end
