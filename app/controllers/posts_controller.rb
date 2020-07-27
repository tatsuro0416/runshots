class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
        redirect_to post_path(@post.id)
        flash[:notice] = '投稿に成功しました'
    else  
      redirect_to root_path
      flash[:alert] = '投稿に失敗しました'
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def index
    @posts = Post.order(created_at: "DESC").page(params[:id]).without_count.per(1)
  end

  private
    def post_params
      params.require(:post).permit(:caption, 
                                  :description,
                                  :loadtype,
                                  :timezone,
                                  :updown,
                                  :trafficlight,
                                  :crowd,
                                  images: [],
                                  ).merge(user_id: current_user.id)
    end
end
