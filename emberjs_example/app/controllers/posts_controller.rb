class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :json

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      respond_with(@post)
    else
      respond_with(@post, errors: @post.errors, status: :unprocessable_entity)
    end
  end

  def update
    if @post.update(post_params)
      respond_with(@post)
    else
      respond_with(@post, errors: @post.errors, status: :unprocessable_entity)
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_with(message: "Deleted post #{@post.id}")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :author_id)
    end
end
