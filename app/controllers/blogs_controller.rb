class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :publish, :like]

  PER_PAGE = 5

  def index
    @blogs = Blog.published.order(created_at: :desc)
    @mode = :published
    paginate
  end

  def drafts
    @blogs = Blog.drafts.order(created_at: :desc)
    @mode = :drafts
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
      redirect_to @blog
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  def publish
    @blog.update(published: true)
    redirect_to @blog
  end

  def like
  @blog.increment!(:likes_count)

  respond_to do |format|
    format.turbo_stream
    format.html { redirect_to @blog }
  end
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
end
