module ApplicationHelper
  include AuthHelper

  def admin_signed_in?
    if user_signed_in?
      current_user.role == "admin"
    end
  end

  def confirmed_member_signed_in?
    if user_signed_in?
      current_user.member.accepted?
    end
  end

  def new_users_count
    User.with(confirm_state: :new).count
  end
end
