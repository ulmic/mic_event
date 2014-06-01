class Admin::ApplicationController < ApplicationController
  before_filter :check_admin_sign_in

  def check_admin_sign_in
    unless user_signed_in?
      redirect_to not_found_errors_path
    else
      #FIXME admin? method
      unless current_user.role == "admin"
        redirect_to not_found_errors_path
      end
    end
  end
end
