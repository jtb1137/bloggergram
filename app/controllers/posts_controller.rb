class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new   
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        
        if @post.save
            flash[:success] = "Post was made"
            redirect_to post_path(@post)
        else
            flash[:alert] = "Post was not made"
            render "new"
        end
    end

    def show

    end

    def edit

    end

    def update
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            render "edit"
        end
    end

    def destroy
        @post.comments.destroy_all
        @post.destroy

        redirect_to root_path
    end

    private
    def post_params
        params.require(:post).permit(:image, :title, :description)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end