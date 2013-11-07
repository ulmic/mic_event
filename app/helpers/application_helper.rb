module ApplicationHelper
  include AuthHelper

  def admin_signed_in?
    if member_signed_in?
      current_member.admin
    end
  end
end
