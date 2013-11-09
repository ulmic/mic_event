class EventDecorator < ApplicationDecorator
  delegate_all

  def date
    if model.begin_datetime.to_date == model.end_datetime.to_date
      model.begin_datetime.to_date
    else
      "#{model.begin_datetime.to_date} - #{model.end_datetime.to_date}"
    end
  end

  def people
    people = []
    model.checkins.each do |checkin|
      people.push(checkin.member)
    end
    people
  end
end
