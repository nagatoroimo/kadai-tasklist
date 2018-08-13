class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    
    if @user.save
      flash[:success] = "ユーザー登録が完了しました"
      redirect_to user_path(@user)
    else
      flash[:denger] = "ユーザー登録が失敗しました"
      render :new
    end
  end
  
  private
  
  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
