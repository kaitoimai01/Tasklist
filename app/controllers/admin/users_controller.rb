class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all.includes(:tasks)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザーを登録しました。'
      redirect_to login_path
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = 'ユーザーを更新しました。'
      redirect_to admin_user_path(@user)
    else
      flash.now[:danger] = 'ユーザーが更新できませんでした。'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to admin_users_url, notice: 'ユーザーを削除しました。'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end
