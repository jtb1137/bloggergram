class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def new
        if user_signed_in?
            @post = Post.new   
        else
            redirect_to new_user_session_path
        end
    end

    def create
        @post = Post.new(post_params)
        
        if @post.save && user_signed_in?
            redirect_to post_path(@post)
        else
            render "new"
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        if user_signed_in?
            @post = Post.find(params[:id])
        else
            redirect_to new_user_session_path
        end
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params) && user_signed_in?
            redirect_to post_path(@post)
        else
            render "edit"
        end
    end

    def destroy
        if user_signed_in?
            @post = Post.find(params[:id])
            @post.destroy
            redirect_to root_path
        else
            redirect_to new_user_session_path
        end
    end

    private
    def post_params
        params.require(:post).permit(:image, :title, :description)
    end
end