class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
        redirect_to root_path
        flash[:notice] = '投稿に成功しました'
    else  
      redirect_to root_path
      flash[:alert] = '投稿に失敗しました'
    end
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
