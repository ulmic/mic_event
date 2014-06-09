module CheckinsHelper
  def event_title(event_id)
    Event.find(event_id).title
  end
end
