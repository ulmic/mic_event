module MembersHelper
  def index_multiple_four?(index)
    index % 4 == 0
  end

  def current_member_on_page?(member)
    current_member == member
  end
end
