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
    if decoded_auth_token.present?
      return Admin.find(decoded_auth_token[:user_id])
    else
      @user || errors.add(:token, 'Invalid token') && nil
    end
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