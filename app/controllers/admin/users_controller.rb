class Admin::UsersController < ApplicationController
  #TODO:共通箇所まとめる

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
    @user = User.new(user_params)

    if @user.save
      flash[:succeess] = 'ユーザーを登録しました。'
      # admin/users/showに遷移
      redirect_to admin_user_path(@user)
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
    @uer = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end