class PostController < ApplicationController
  # before_action :set_post, only: [:show, :download]


  def index
    @post = Post.order('created_at description')
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :active, :url, :description, :image, :active, :seo_key, :seo_title, :seo_desc, :seo_alt, :img_file_name, :img_content_type, :img_file_size, :img_updated_at, :img)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end


