class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            flash[:post_errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def edit
        @post = Post.find_by(id: params[:id])
    end

    def update
        @post = Post.find_by(id: params[:id])
        @post.update(post_params)
        @post.save

        if @post.valid?
           redirect_to post_path(@post)
        else
           flash[:post_errors] = @post.errors.full_messages
           render :edit
        end
    end

    def like
        @post = Post.find_by(id: params[:id])
        @post.likes += 1
        @post.save
        redirect_to post_path(@post)
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end