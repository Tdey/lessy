class ProjectsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "projects_of_#{current_user.id}"
  end
end
