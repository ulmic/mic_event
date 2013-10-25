class MemberDecorator < Draper::Decorator
  delegate_all

  def fio
    "#{model.first_name} #{model.middle_name}"
  end
end
