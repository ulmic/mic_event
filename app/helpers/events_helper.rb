module EventsHelper
  def current_member_checkined?(event)
    if current_member
      current_member.checkins.find_by_event_id(event.id)
    end
  end
end
