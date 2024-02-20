class V1::PostsController < ApplicationController
    # GET /v1/posts
    def index
        posts = Post.all
        render json: posts
    end

    # POST /v1/posts
    def create
        post_params = params.require(:post).permit(:title, :body)
        post = Post.new(post_params)

        if post.save
        render json: post, status: :created
        else
        render json: post.errors, status: :unprocessable_entity
        end
    end

    # GET /v1/posts/:id
    def show
        post = Post.find(params[:id])
        render json: post
    end

    # PATCH/PUT /v1/posts/:id
    def update
        post = Post.find(params[:id])
        post_params= params.require(:post).permit(:title, :body)

        if post.update(post_params)
        render json: post
        else
        render json: post.errors, status: :unprocessable_entity
        end
    end

    # DELETE /v1/posts/:id
    def destroy
        post = Post.find(params[:id])
        post.destroy
    end
end