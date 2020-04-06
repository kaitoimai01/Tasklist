module SessionsHelper
  # 現在ログインしているユーザを取得するメソッド
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ーザがログインしていれば true を返し、ログインしていなければ false を返すメソッド
  def logged_in?
    !!current_user
  end
end
