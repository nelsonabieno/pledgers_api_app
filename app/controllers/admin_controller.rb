class AdminController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :find_admin, only: [:show, :update, :destroy]

  def index
    render json: { admins: Admin.all }, status: :ok
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      render json: { admin: @admin, message: 'Admin user successfully created' }, status: :created
    else
      render json: { error: @admin.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def show
    render json: { admin: @admin, message: 'Admin record successfully retrieved' }, status: :ok
  end

  def update
    @admin = Admin.new(admin_params)

    if @admin.update
      render json: { admin: @admin, message: 'Admin record successfully updated' }, status: :ok
    else
      render json: { error:@admin.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def destroy
    if @admin.destroy
      render json: { admin:@admin, message: 'Admin record successfully deleted' }, status: :ok
    else
      render json: { error: @admin.errors.full_messages.to_sentence }, status: :internal_server_error
    end
  end

  private

  def find_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.permit(:email, :password, :password_confirmation, :token, :expired_at, :first_name, :last_name)
  end
end