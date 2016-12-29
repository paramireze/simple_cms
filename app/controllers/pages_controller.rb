class PagesController < ApplicationController

  layout 'admin'

  before_action :find_subject
  before_action :set_page_count, :only => [:new, :create, :edit, :update]

  def index
    @pages = @subject.pages.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(:subject_id => @subject.id)
    @page_count = Page.count + 1
  end

  def create
    @page = Page.new(page_params)
    @page.subject = @subject
    if @page.save
      flash[:notice] = "page '#{@page.name}' has been created! GOOD FUCKING JOB!"
      redirect_to(pages_path(:subject_id => @subject.id))
    else
      flash[:notice] = "failed to create"
      @page_count = Page.count + 1
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "hey, you updated a page. Well done matey! #{@subject.id} "
      redirect_to(pages_path(:subject_id => @subject.id))
    else
      flash[:notice] = "failed update"
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "page '#{@page.name}' has been destroyed!"
    logger.info "before redirect --> #{@subject.id}"
    redirect_to(pages_path(:subject_id => @subject.id))
  end

  private

  def page_params
    params.require(:page).permit(:name, :position, :visible, :permalink)
  end

  def find_subject
    logger.info request.query_parameters
    logger.info "dump qry prms --> #{request.query_parameters['subject_id']} "
    logger.info "params get id --> #{params[:subject_id]}"
    logger.info "params display--> #{params.inspect}"

    @subject = Subject.find(params[:subject_id])
  end

  def set_page_count
    @page_count = Page.count
    if params[:action] == 'new' || params[:action] == 'create'
      @page_count += 1
    end
  end
end
