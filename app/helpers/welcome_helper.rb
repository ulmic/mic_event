module WelcomeHelper
  def event_border(count, index)
    if index == count - 1
      "none"
    else
      "1px grey solid"
    end
  end
end
