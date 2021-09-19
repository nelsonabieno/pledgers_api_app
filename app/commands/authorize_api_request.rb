require 'jwt'
class AuthorizeApiRequest
  prepend SimpleCommand
  attr_reader :headers

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  def user
    @user ||= Admin.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if @headers.present?
      return @headers.to_s.split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end

end