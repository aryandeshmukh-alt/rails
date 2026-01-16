class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :publish, :like]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  PER_PAGE = 5

  def index
    @blogs = Blog.published.order(created_at: :desc)
    paginate
  end

  def drafts
    @blogs = Blog.drafts.order(created_at: :desc)
    paginate
    render :index
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to @blog, notice: "Blog created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: "Blog updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "Blog deleted."
  end

  def publish
    @blog.update(published: true)
    redirect_to @blog, notice: "Blog published."
  end

  def like
    @blog.increment!(:likes_count)
    redirect_to @blog
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body)
  end

  def paginate
    page = params[:page].to_i
    page = 1 if page < 1
    @blogs = @blogs.offset((page - 1) * PER_PAGE).limit(PER_PAGE)
    @current_page = page
  end

  def record_not_found
    redirect_to blogs_path, alert: "Blog not found."
  end
end
