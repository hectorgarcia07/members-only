class PostsController < ApplicationController
    load_and_authorize_resource 
    #only register users can create a post
    before_action :authenticate_user!, except: [:index]

    #will show all the post with 'anonymous' as username if not logged in
    #otherwise, if logged in, will display all post with username
    def index
        @posts = Post.paginate(page: params[:page], per_page: 7).order('id DESC')
    end

    def my_posts
        @posts = current_user.posts.paginate(page: params[:page], 
                                per_page: 7).order('id DESC') if user_signed_in?
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

    #renders a particular post to edit
    def edit
        @post = Post.find_by(id: params[:id])
        redirect_to root_url if @post == nil
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            flash[:notice] = "Post updated sucessfully!"
            redirect_to root_url
        else
            flash.now[:error] = "Error: Post cannot be empty."
            render 'posts/edit'
        end
    end

    def delete
        post = Post.find_by(params[:id])
        post.delete
        flash[:notice] = "Post has been deleted!"
        redirect_to root_url
    end

    private
    def post_params
        params.require(:post).permit(:post)
    end
end
