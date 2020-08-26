class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index#ブラウザからGETメソッドで/blogsのリクエストがきたとき、indexアクション起動
    @blogs = Blog.all
    # raise
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path,notice: "ブログを作成しました！"
      else
        render :new
      end
    # Blog.create(blog_params)
    # redirect_to new_blog_path
    end
  end
  def edit
    # @blog = Blog.find(params[:id]
  end
  def update
    # @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path,notice: "ブログを編集しました！"
    else
      render :edit
    end
  end
  def show
    # @blog = Blog.find(params[:id])
  end
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました"
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
