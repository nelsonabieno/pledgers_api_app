require 'jwt'
class JsonWebToken
  ALGORITHM = 'HS256'

  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, auth_secret, ALGORITHM)
    end

    def decode(token)
      res= JWT.decode(token, auth_secret, true, { algorithm: ALGORITHM }).first
      HashWithIndifferentAccess.new res
      rescue JWT::DecodeError => e
        puts "#{e.message}"
    end

    def auth_secret
       Rails.application.secrets.secret_key_base
    end
  end
end