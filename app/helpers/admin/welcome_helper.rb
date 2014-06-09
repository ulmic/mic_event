module Admin::WelcomeHelper
  def new_users_count
    User.with(confirm_state: :new).count
  end

  def all_checkins_count
    Checkin.count
  end
  def all_events_count
    Event.count
  end
  def all_places_count
    Place.count
  end
  def all_members_count
    Member.count
  end
  def all_programs_count
    Program.count
  end
end
