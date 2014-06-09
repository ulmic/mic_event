class MemberDecorator < Draper::Decorator
  delegate_all

  def fio
    "#{model.first_name} #{model.middle_name}"
  end

  def user_pic
    detector = RussianSex::Detector.new
    if detector.detect(model.middle_name) == 'M'
      'male.png'
    elsif detector.detect(model.middle_name) == 'F'
      'female.png'
    end
  end

  def present_photo
    unless model.photo.blank?
      model.photo
    else
      user_pic
    end
  end

  def present_photo_big_thumb
    unless model.photo.blank?
      model.photo.big_thumb
    else
      user_pic
    end
  end

  def present_photo_thumb
    unless model.photo.blank?
      model.photo.thumb
    else
      user_pic
    end
  end

  def present_photo_mini_thumb
    unless model.photo.blank?
      model.photo.mini_thumb
    else
      user_pic
    end
  end

  def checkin_on(event)
    model.checkins.select { |checkin| checkin.event_id == event.id }.first
  end
end
