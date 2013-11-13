module EventsHelper
  def current_user_checkined?(event)
    if current_user
      current_user.member.checkins.find_by_event_id(event.id)
    end
  end
end
