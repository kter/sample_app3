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
end
