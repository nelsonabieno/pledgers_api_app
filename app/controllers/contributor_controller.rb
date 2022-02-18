class ContributorController < ApplicationController
  before_action :find_contributor, only: [:show, :update, :destroy]

  def index
    render json: { contributors: Contributor.all }, status: :ok
  end

  def create
    @contributor = Contributor.new(contributor_params)

    if @contributor.save
      render json: { contributor: @contributor, message: 'Contributor successfully created' }, status: :created
    else
      render json: { contributor: @contributor.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def show
    render json: { contributor: @contributor, message: 'Contributor record successfully retrieved' }, status: :ok
  end

  def update
    if @contributor.update(contributor_params)
      render json: { contributor: @contributor, message: 'Contributor record successfully updated' }, status: :ok
    else
      render json: { error: @contributor.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def  destroy
    if @contributor.destroy
      render json: { contributor:@contributor, message: 'Contributor record successfully deleted' }, status: :ok
    else
      render json: { error: @contributor.errors.full_messages.to_sentence }, status: :internal_server_error
    end
  end

  private

  def contributor_params
    params.permit(:first_name, :last_name, :email, :phone_number, :area_id, :parish_id, :zone_id)
  end

  def find_contributor
    @contributor = Contributor.find(params[:id])
  end
end