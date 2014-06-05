class EventDecorator < Draper::Decorator
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

  require 'tactful_tokenizer'

  def lead
    t = TactfulTokenizer::Model.new
    t.tokenize_text(model.description).first
  end

  def long_lead
    "#{model.description.first(200)}..."
  end
end
