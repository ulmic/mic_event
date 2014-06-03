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
    Event.last.photo if Event.any?
  end

  def last_event_title
    Event.last.title if Event.any?
  end

  def last_event_description
    Event.last.description if Event.any?
  end

  def last_event_date
    Event.last.decorate.date if Event.any?
  end
end
