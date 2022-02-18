class AccountController < ApplicationController
  before_action :find_account, only: [:show, :update, :destroy]

  def index
    render json: { accounts: Account.all }, status: :ok
  end

  def create
    @account = Account.new(account_params)
    @account.contributors_id = params[:id]
    byebug
    if @account.save
      render json: { account: @account, message: 'account successfully created' }, status: :created
    else
      render json: { account: @account.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def show
    render json: { account: @account, message: 'account record successfully retrieved' }, status: :ok
  end

  def update
    if @account.update(account_params)
      render json: { account: @account, message: 'account record successfully updated' }, status: :ok
    else
      render json: { error: @account.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def  destroy
    if @account.destroy
      render json: { account:@account, message: 'account record successfully deleted' }, status: :ok
    else
      render json: { error: @account.errors.full_messages.to_sentence }, status: :internal_server_error
    end
  end

  private

  def account_params
    # byebug
    # params.permit(:account_number, :bank_name, :contributors_id)
    params.permit(:account_number, :bank_name)
  end

  def find_account
    @account = Account.find(params[:id])
  end
end