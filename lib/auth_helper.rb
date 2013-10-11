module AuthHelper
  def member_sign_in(member)
    session[:member_id] = member.id
  end

  def member_signed_in?
    session[:member_id] && Member.find_by_id(session[:member_id])
  end

  def member_sign_out
    session[:member_id] = nil
  end

  def authenticate_member?(member, password)
    member.password === password
  end
end
