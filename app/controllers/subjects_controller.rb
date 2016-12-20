class SubjectsController < ApplicationController
  def index
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
    @subject = Subject.new(params[:subject])
    #save the object
    if @subject.save
      #if save succeeds, redirect to the index action
      redirect_(subjects_path)
    else
      #if save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end
end
