class ApplicationController < ActionController::Base
  include AuthHelper

  def check_user_sign
    unless user_signed_in?
      redirect_to '/404'
    end
  end

  protect_from_forgery
end
