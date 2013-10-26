class PlaceDecorator < Draper::Decorator
  delegate_all

  def people
    people = []
    model.events.each do |event|
      event.checkins.each do |checkin|
        people.push(checkin.member)
      end
    end
    people.uniq
  end
end
