class TicketsController < ApplicationController
  def show
    @member = Member.find(params[:number]).decorate
  end
end
