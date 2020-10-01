# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :check_user, only: %i[edit destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def check_user
    @post = Post.find(params[:id])
    unless current_user&.id == @post.user_id || current_user.admin == true
      redirect_to root_path
      nil
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :category, :user_id, :main_image)
  end
end
#   def index
#     @posts = Post.all.order('created_at DESC')
#   end
#
#   def new
#     @post = Post.new
#   end
#
#   def create
#     @post = Post.new(post_params)
#
#     if @post.save
#       redirect_to @post
#     else
#       render 'new'
#     end
#   end
#
#   def show; end
#
#   def update
#     if @post.update(post_params)
#       redirect_to @post
#     else
#       render 'edit'
#     end
#   end
#
#   def edit
#     @post = Post.find(params[:id])
#   end
#
#   def destroy
#     @post = Post.find(params[:id])
#     @post.destroy
#
#     redirect_to posts_path
#   end
#
#   private
#
#   def post_params
#     params.require(:post).permit(:title, :content)
#   end
#
#   def find_post
#     @post = Post.find(params[:id])
#   end
# end
