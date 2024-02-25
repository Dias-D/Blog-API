class V1::UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, raise: false  

    before_action :authenticate_devise_api_token!
    before_action :set_user, only: %i[ show update destroy ]
    
    # GET /v1/users
    def index
        @users = User.all

        render json: @users
    end

    # GET /v1/users/:id
    def show
        render json: @user
    end

    # POST /v1/users
    def create
        @user = User.new(user_params)

        if @user.save
        render json: @user, status: :created
        else
        render json: @user.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /v1/users/:id
    def update
        if @user.update(user_params)
        render json: @user
        else
        render json: @user.errors, status: :unprocessable_entity
        end
    end

    # DELETE /v1/users/:id
    def destroy
        @user.destroy
    end
    
    private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
        @user = User.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def user_params
        params.require(:user).permit(:name, :email, :password)
        end
end
