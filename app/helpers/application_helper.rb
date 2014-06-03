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

  def last_event_photo
    Event.last.photo
  end

  def last_event_title
    Event.last.title
  end

  def last_event_description
    Event.last.description
  end

  def last_event_date
    Event.last.decorate.date
  end
end
