class ProjectsController < ApplicationController

  def index
    @routes = %w[ FAQ Learn\ More Documentation Community About ]
    dummy_stuffs = %w[ this_is_kinda_cool what_do_you_think_? oh_time_is_up ]
    @dummies = dummy_stuffs
    @projects = Project.all
  end

  def show
    # params = { "id" => "1"}
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    # {
    # "project" =>
    #   {
    #     "name" => "plan a vacation"
    #   }
    # }
    if @project.save
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  # these bois are strong parameters
  def project_params
    params.require(:project).permit(:name)
  end
end
