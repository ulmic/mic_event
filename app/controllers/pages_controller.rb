class PagesController < ApplicationController
  before_filter :check_confirmed_member_sign_in, only: [ :new, :create ]
  def you_are_busted
    user_sign_out
  end
  def privacy
  end
  def show
    @page = Page.find_by_slug params[:slug]
    unless @page and @page.decorate.published?
      redirect_to not_found_errors_path
    end
  end
end
