class ProgramsController < ApplicationController
  before_filter :check_admin_sign_in, except: [ :index, :show ]

  def index
    @programs = Program.all.reverse
  end

  def show
    @program = Program.find params[:id]
  end

  def new
    @program = Program.new
  end

  def edit
    @program = Program.find params[:id]
  end

  def create
    @program = Program.new params[:program]
    if @program.save
      redirect_to @program
    else
      render action: :new
    end
  end

  def update
    @program = Program.find params[:id]
    if @program.update_attributes params[:program]
      redirect_to @program
    else
      render action: :edit
    end
  end

  def destroy
    @program = Program.find params[:id]
    @program.destroy
    redirect_to programs_path
  end
end
