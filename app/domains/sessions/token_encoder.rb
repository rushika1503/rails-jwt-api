module Sessions
  class TokenEncoder
  
  SECRET_KEY = Rails.application.secrets.secret_key_base. to_s
  ALGORITHM_TYPE = 'HS256'.freeze
 
  
    def self.encode(opts)
      JWT.encode(opts, SECRET_KEY)
    end
  
    def self.decode(token)
      decoded = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new decoded
    end
  end
 end