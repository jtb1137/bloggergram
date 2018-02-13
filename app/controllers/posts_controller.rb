class PostsController < ApplicationController

    def index
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
    end

    def destroy
    end

    private
    def post_params
        params.require(:post).permit(:title, :description)
    end
end
