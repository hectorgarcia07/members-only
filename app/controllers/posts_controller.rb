class PostsController < ApplicationController
    #only register users can create a post
    before_action :authenticate_user!, only: [:create, :new]

    #will show all the post with 'anonymous' as username if not logged in
    #otherwise, if logged in, will display all post with username
    def index
        @posts = Post.all
    end

    #will show the current users post only
    def show
        @posts = Post.where(user_id: current_user.id)
    end

    #will create a post
    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:notice] = "Post successfully made!"
            redirect_to root_url
        else
            flash[:alert] = "Cannot submit an empty post."
            redirect_to new_post_url
        end
    end

    #renders view for post.
    def new
        @post = Post.new
    end

    private
    def post_params
        params.require(:post).permit(:post)
    end
end
