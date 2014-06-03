module ApplicationHelper
  include AuthHelper

  def admin_signed_in?
    if user_signed_in?
      current_user.role == "admin"
    end
  end

  def confirmed_member_signed_in?
    if user_signed_in?
      current_user.accepted?
    end
  end
end
