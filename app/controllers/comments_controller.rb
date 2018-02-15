class CommentsController < ApplicationController
    before_action :set_post, only: [:index, :new, :create, :show, :show]

    def index
        @comments = @post.comments
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.post_id = @post.id

        if @comment.save
            flash[:success] = "Comment was made"
            redirect_to post_path(@post)
        else
            flash[:alert] = "Comment was not made"
            render 'show'
        end
    end

    def show
        @comment = @comments.find(params[:post_id])
    end

    def delete

    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end

    def set_post
        @post = Post.find(params[:post_id])
    end
end
