module MembersHelper
  def index_multiple_four?(index)
    index % 4 == 0
  end

  def current_user_on_page?(user)
    current_user.id == user.id
  end
end
