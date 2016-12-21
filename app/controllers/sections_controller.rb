class SectionsController < ApplicationController
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

  def section_params
    params.require(:section).permit(:name, :position, :visibile, :content)
  end

end
