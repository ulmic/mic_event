class MemberDecorator < Draper::Decorator
  delegate_all

  def fio
    "#{model.first_name} #{model.middle_name}"
  end

  def present_photo
    unless model.photo.blank?
      model.photo
    else
      'male.png'
    end
  end
end
