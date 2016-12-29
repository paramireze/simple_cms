class SectionsController < ApplicationController

  layout 'admin'

  before_action :find_page
  before_action :set_section_count, :only => [:new, :create, :edit, :update]

  def index
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:page_id => @page.id)
  end

  def create
    @section = Section.new(section_params)
    @section.page = @page
    if @section.save
      flash[:notice] = "hey, you inserted a section!"

      redirect_to(sections_path(:page_id => @page.id))
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
      flash[:notice] = "hey, you updated a section. Well done matey!"
      redirect_to(sections_path(:page_id => @page.id))
    else
      flash[:notice] = "failed update you imbicile"
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
    redirect_to(sections_path(:page_id => @page.id))
  end

  private

  def section_params
    params.require(:section).permit(:name, :position, :visibile, :content, :content_type)
  end

  def find_page
    # @page = Page.find(params[:page_id])
    logger.info request.query_parameters
    logger.info "dump qry prms --> #{request.query_parameters['page_id']} "
    logger.info "params get id --> #{params[:page_id]}"
    logger.info "params display--> #{params.inspect}"
    #@page = Page.find(10)
    @page = Page.find(params[:page_id])
  end

  def set_section_count
    @section_count = Section.count

    if params[:action] == 'new' || params[:action] == 'create'
      @section_count += 1
    end
  end
end
