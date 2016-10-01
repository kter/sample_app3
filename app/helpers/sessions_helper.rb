module SessionsHelper

  # 渡されたユーザでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  # 現在ログインしているユーザを返す
  def current_user
    # @current_userが存在しない場合のみfind_byが動く
    # findでは例外が返る時があるのでfind_byを使う
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ユーザがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

  # 現在のユーザをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
