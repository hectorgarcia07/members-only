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
        @posts = current_user.posts
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

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            flash[:notice] = "Post updated sucessfully!"
            redirect_to root_url
        else
            render 'posts/edit'
        end
    end

    def delete

    end

    private
    def post_params
        params.require(:post).permit(:post)
    end
end
