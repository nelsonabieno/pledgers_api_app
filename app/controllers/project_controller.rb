class ProjectController < ApplicationController
  before_action :find_project, only: [:show, :update, :destroy]

  def index
    render json: { projects: Project.all }, status: :ok
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      render json: { project: @project, message: 'project successfully created' }, status: :created
    else
      render json: { project: @project.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def show
    render json: { project: @project, message: 'project record successfully retrieved' }, status: :ok
  end

  def update
    if @project.update(project_params)
      render json: { project: @project, message: 'project record successfully updated' }, status: :ok
    else
      render json: { error: @project.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def  destroy
    if @project.destroy
      render json: { project:@project, message: 'project record successfully deleted' }, status: :ok
    else
      render json: { error: @project.errors.full_messages.to_sentence }, status: :internal_server_error
    end
  end

  private

  def project_params
    params.permit(:name, :account_number, :bank_name)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end