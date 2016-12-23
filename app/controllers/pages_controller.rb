class PagesController < ApplicationController

  layout 'admin'
  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    @page_count = Page.count + 1
    @subjects = Subject.sorted

  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "page '#{@page.name}' has been created! GOOD FUCKING JOB!"
      redirect_to(pages_path)
    else
      flash[:notice] = "failed to create"
      @page_count = Page.count + 1
      @subjects = Subject.sorted
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count
    @subjects = Subject.sorted
  end

  def update
    @page = Page.find(params[:id])
    @subjects = Subject.sorted
    if @page.update_attributes(page_params)
      flash[:notice] = "hey, you updated a page. Well done matey!"
      redirect_to(pages_path)
    else
      flash[:notice] = "failed update"
      @page_count = Page.count
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

  def page_params
    params.require(:page).permit(:subject_id, :name, :position, :visible, :permalink)
  end

end
