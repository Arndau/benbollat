class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :create]

#   def create
#     @user = User.new(user_params)
#     @bien.user = current_user
#     authorize @user

#     if @user.save
#       redirect_to index_path(@user)
#     else
#       render :new
#     end
#   end

#   def show
#     @user = current_user
#     @user = User.find(params[:id])
#     authorize @user
#   end

#   def destroy
#     @user.destroy
#   end

#    private

#   def set_user
#     @users = User.find(params[:id])
#     authorize @user
#   end

#   def user_params
#     params.require(:user).permit(:email, :surnom, :avatar)
#   end
# end
