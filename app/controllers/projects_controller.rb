class ProjectsController < ApplicationController

  def index
    @routes = %w[ FAQ Learn\ More Documentation Community About ]
    dummy_stuffs = %w[ this_is_kinda_cool what_do_you_think_? oh_time_is_up ]
    @dummies = dummy_stuffs
    @projects = Project.all
  end
#  def show
    # params = { "id" => "1"}
#    @project = Project.find(params[:id])
#  end
  define_method(:show) { @project = Project.find(params[:id])}

  define_method(:new) { @project = Project.new }
#  def new
#    @project = Project.new
#  end

  def create
    @page_info = "edit"
    @project = Project.new(project_params)
    # {
    # "project" =>
    #   {
    #     "name" => "plan a vacation"
    #   }
    # }
    if @project.save
      flash[:notice] = "Project has been created!"
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @page_info = "edit"
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:notice] = "Project has been updated!"
      redirect_to project_path(@project)
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy
    flash[:notice] = "Project deleted."
    redirect_to projects_path
  end

  # these bois are strong parameters
  def project_params
    params.require(:project).permit(:name)
  end
end
