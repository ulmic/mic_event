module AuthHelper
  def user_sign_in(user)
    session[:user_id] = user.id
  end

  def user_signed_in?
    session[:user_id] && User.find_by_id(session[:user_id])
  end

  def user_sign_out
    session[:user_id] = nil
  end

  def authenticate_user?(user, password)
    user.password === password
  end
end
