class AssignmentsController < ApplicationController
  def new
    @person = Person.find(params[:person_id])
    @assignment = Assignment.new
  end

  def create
    @person = Person.find(params[:person_id])
    if current_user
      @assignment = Assignment.new(assignment_params)
      @assignment.person_id = @person.id
      if @assignment.save
        redirect_to person_path(@person)
      else
      render :new
      end
    else
      redirect_to signin_path, notice: "Must be logged in"
    end
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update(assignment_params)
      redirect_to person_path(@person)
    else
      render :edit
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    redirect_to person_path(@person)
  end

  private
  def assignment_params
    params.require(:assignment).permit(:roles, :location_id, :person_id)
  end

end
