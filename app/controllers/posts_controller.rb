class PostsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]
  def index
    @posts = if current_user
               current_user.feed.includes(:user).page(params[:page]).order(created_at: :desc)
             else
               Post.all.includes(:user).page(params[:page]).order(created_at: :desc)
             end
    @users = User.recent(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    tag_list = params[:post][:tag].split(',')
    if @post.save
      @post.save_posts(tag_list)
      redirect_to posts_path, success: '投稿しました'
    else
      @tag_list = params[:post][:tag]
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
    @tag_list = @post.tags.distinct.pluck(:name).join(',')
  end

  def update
    @post = current_user.posts.find(params[:id])
    tag_list = params[:post][:tag].split(',')
    if @post.update(post_params)
      @post.save_posts(tag_list)
      redirect_to posts_path, success: '投稿を更新しました'
    else
      @tag_list = params[:post][:tag]
      flash.now[:danger] = '投稿の更新に失敗しました'
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    @comment = Comment.new
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to posts_path, success: '投稿を削除しました'
  end

  def search
    @posts = @search_form.search.includes(:user).page(params[:page])
  end

  private

  def post_params
    params.require(:post).permit(:body, images: [], tag: [])
  end
end
