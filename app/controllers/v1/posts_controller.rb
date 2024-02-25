class V1::PostsController < ApplicationController
    skip_before_action :verify_authenticity_token, raise: false  

    before_action :authenticate_devise_api_token!, except: [:index]
    before_action :set_post, only: %i[ show update destroy ]
    
    # GET /v1/posts
    def index
        @posts = Post.all

        render json: @posts
    end

    # GET /v1/posts/:id
    def show
        render json: @post
    end

    # POST /v1/posts
    def create
        @post = Post.new(post_params)

        if @post.save
        render json: @post, status: :created
        else
        render json: @post.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /v1/posts/:id
    def update
        if @post.update(post_params)
        render json: @post
        else
        render json: @post.errors, status: :unprocessable_entity
        end
    end

    # DELETE /v1/posts/:id
    def destroy
        @post.destroy
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_post
        @post = Post.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def post_params
        params.require(:post).permit(:title, :body, :user_id)
        end
end
