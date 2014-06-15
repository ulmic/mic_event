class PageDecorator < Draper::Decorator
  delegate_all

  def published?
    model.publish <= DateTime.now
  end
end
