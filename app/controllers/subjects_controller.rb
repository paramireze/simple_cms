class SubjectsController < ApplicationController

  layout 'admin'

  before_action :set_subject_count, :only => [:new, :create, :edit, :update]
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    logger.debug("*** Testing the logger. ***")
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    #Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    #save the object
    if @subject.save
      #if save succeeds, redirect to the index action
      flash[:notice] = "subjected created successfully"
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    #Instantiate a new object using form parameters
    @subject = Subject.find(params[:id])
    #save the object
    if @subject.update_attributes(subject_params)
      #if save succeeds, redirect to the index action
      flash[:notice] = "subject updated successfully"
      redirect_to(subjects_path(@subject))
    else
      render('new')
    end

  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "subject '#{@subject.name}' destroyed successfully."
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :created_at, :permalink)
  end

  def set_subject_count
    @subject_count = Subject.count

    if params[:action] == "create" || params[:action] == "new"
      @subject_count += 1
    end
  end
end
