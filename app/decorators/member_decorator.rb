class MemberDecorator < ApplicationDecorator
  delegate_all

  def fio
    "#{model.first_name} #{model.middle_name}"
  end
end
