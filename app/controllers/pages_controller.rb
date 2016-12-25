class PagesController < ApplicationController

  layout 'admin'

  before_action :find_subjects, :only => [:new, :create, :edit, :update]
  before_action :set_page_count, :only => [:new, :create, :edit, :update]
  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    @page_count = Page.count + 1
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "page '#{@page.name}' has been created! GOOD FUCKING JOB!"
      redirect_to(pages_path)
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
      flash[:notice] = "hey, you updated a page. Well done matey!"
      redirect_to(pages_path)
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
    redirect_to(pages_path)
  end

  private

  def page_params
    params.require(:page).permit(:subject_id, :name, :position, :visible, :permalink)
  end

  def find_subjects
    @subjects = Subject.sorted
  end

  def set_page_count
    @page_count = Page.count
    if params[:action] == 'new' || params[:action] == 'create'
      @page_count += 1
    end
  end
end
