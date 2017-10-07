class Api::Users::ProjectsController < ApiController

  def index
    @projects = current_user.projects.page(params[:page])
  end

  def create
    @project = Project.create!(create_project_params)
    ActionCable.server.broadcast(
      "projects_of_#{current_user.id}",
      type: 'new',
      project: @project.to_json,
    )
    render status: :created
  end

private

  def create_project_params
    fetch_resource_params(:project, [:name]).merge(user: current_user)
  end

end
