class PledgeController < ApplicationController
  before_action :find_pledge, only: [:show, :update, :destroy]

  def index
    render json: { pledges: Pledge.all }, status: :ok
  end

  def create
    @pledge = Pledge.new(pledge_params)
    byebug
    if @pledge.save
      render json: { account: @pledge, message: 'Pledge successfully created' }, status: :created
    else
      render json: { account: @pledge.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  # def show
  #   render json: { account: @account, message: 'account record successfully retrieved' }, status: :ok
  # end
  #
  # def update
  #   if @account.update(account_params)
  #     render json: { account: @account, message: 'account record successfully updated' }, status: :ok
  #   else
  #     render json: { error: @account.errors.full_messages.to_sentence }, status: :unprocessable_entity
  #   end
  # end
  #
  # def  destroy
  #   if @account.destroy
  #     render json: { account:@account, message: 'account record successfully deleted' }, status: :ok
  #   else
  #     render json: { error: @account.errors.full_messages.to_sentence }, status: :internal_server_error
  #   end
  # end

  private

  def pledge_params
    params.permit(:contributors_id, :projects_id, :amount)
  end

  def find_pledge
    @pledge = Pledge.find(params[:id])
  end
end
