module ApplicationHelper
  include AuthHelper

  def admin_signed_in?
    if user_signed_in?
      current_member.admin
    end
  end
end
