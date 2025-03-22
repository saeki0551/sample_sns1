class PostsController < ApplicationController

    def index
        @posts = Post.all.order(updated_at: :desc)
    end 

    def new
        @post = Post.new #空のインスタンス生成
    end

    def create
        @post = Post.new(post_params) #データを新規登録するためのインスタンス生成
        # binding.pry
        if @post.save
            redirect_to posts_path
        else
            redirect_to new_post
        end
    end

    def post_params
        params.require(:post).permit(:title, :content)
    end
end
