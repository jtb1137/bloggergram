class CommentsController < ApplicationController
    before_action :set_post, only: [:index, :show]
    before_action :set_comments, only: [:index, :show]

    def index
    end

    def create
        @comment = @post.comments.build(comment_params)
        @comment.user_id = current_user.id
    end

    def show
        @comment = @comments.find(params[:id])
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

    def set_comments
        @comments = @post.comments
    end
end
