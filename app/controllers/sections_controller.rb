class SectionsController < ApplicationController

  layout 'admin'

  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      redirect_to(sections_path)
    else
      flash[:notice] = 'you did not create a record...'
      redirect_to(new_section_path)
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notification] = "hey, you updated a section. Well done matey!"
      redirect_to(sections_path)
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notification] = "section '#{@section.name}' has been destroyed!"
    redirect_to(sections_path)
  end

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visibile, :content)
  end

end
