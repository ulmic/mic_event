module EventsHelper
  def current_member_checkined?(event)
    current_member.checkins.find_by_event_id(event.id)
  end
end
