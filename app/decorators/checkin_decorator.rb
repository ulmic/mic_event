class CheckinDecorator < Draper::Decorator
  delegate_all

  def status_locale
    if model.status.organizer?
      I18n.t('organizer')
    elsif model.status.participant?
      I18n.t('participant')
    end
  end
end
