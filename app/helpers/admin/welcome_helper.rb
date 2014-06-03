module Admin::WelcomeHelper
  def new_users_count
    User.with(confirm_state: :new).count
  end

  def checkins_count
    Checkin.count
  end
  def events_count
    Event.count
  end
  def places_count
    Place.count
  end
  def members_count
    Member.count
  end
  def programs_count
    Program.count
  end
end
