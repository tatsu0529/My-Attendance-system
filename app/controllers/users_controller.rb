class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end
  
  def edit
  end
  
  def update
      @user = User.find(params[:id])
    if @user.update_atrributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to user_url
    else
      render :edit_user_url
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else  
      render :new
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
