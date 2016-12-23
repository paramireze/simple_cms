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
    @section_count = Section.count + 1
    @pages = Page.sorted


  end

  def create
    @section = Section.new(section_params)
    if @section.save
      redirect_to(sections_path)
    else
      @section_count = Section.count + 1
      @pages = Page.sorted
      flash[:notice] = 'you did not create a record...'
      redirect_to(new_section_path)
    end
  end

  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count
    @pages = Page.sorted
  end

  def update
    @section = Section.find(params[:id])
    @section_count = Section.count + 1

    if @section.update_attributes(section_params)
      flash[:notice] = "hey, you updated a section. Well done matey!"
      redirect_to(sections_path)
    else
      flash[:notice] = "failed update you imbicile"
      @section_count = Section.count
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "section '#{@section.name}' has been destroyed!"
    redirect_to(sections_path)
  end

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visibile, :content)
  end

end
