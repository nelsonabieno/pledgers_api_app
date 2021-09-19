require 'jwt'
class ApplicationController < ActionController::API
  before_action :authenticate_request
  skip_before_action :authenticate_request, only: [:create]

  attr_reader :current_user

  private

  def authenticate_request
    request_header = request.env['HTTP_AUTHORIZATION'] || request.headers
    @current_user = AuthorizeApiRequest.call(request_header).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
