class Api::BlogsController < Api::BaseController

  before_action :set_blog, only: [:show, :update, :destroy]

  def index
    q = {
      author_eq: params[:author],
      title_cont: params[:title],
      desc_cont: params[:desc]
    }
    @blogs = Blog.ransack(q).result.order("id desc").page(params[:page]).per(params[:per_page])
    @meta = meta.merge(
      total_page: @blogs.total_pages,
      total_count: @blogs.total_count,
      current_page: (params[:page] || 1)
    )
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      render_200({id: @blog.id})
    else
      render_400(@blog.errors.messages)
    end
  end

  def update
    if @blog.update(blog_params)
      render_200({id: @blog.id})
    else
      render_400(@blog.errors.messages)
    end
  end

  def show
    
  end

  def destroy
    if @blog.destroy
      render_200
    else
      render_400
    end
  end

  private
    def blog_params
      params.permit(
        :author, 
        :title, 
        :desc
      )
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end

end
