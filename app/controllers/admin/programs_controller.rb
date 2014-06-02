class Admin::ProgramsController < Admin::ApplicationController
  def index
    @programs = Program.all.reverse
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
      redirect_to admin_programs_path
    else
      render action: :new
    end
  end

  def update
    @program = Program.find params[:id]
    if @program.update_attributes params[:program]
      redirect_to edit_admin_program_path @program
    else
      render action: :edit
    end
  end

  def destroy
    @program = Program.find params[:id]
    @program.destroy
    redirect_to admin_programs_path
  end
end
