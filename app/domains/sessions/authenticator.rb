module Sessions
    class Authenticator < Actionable::Action
    
      step :find_user
      step :authenticate
      step :generate_token
      def initialize(
        email,
        password,
        jwt_encoder= Sessions::TokenEncoder
      )
        @_email= email
        @_password = password
        @_jwt_encoder = jwt_encoder
        @token = nil
        @exp = nil
      end
  
      private
      def find_user
        @user = User.find_by email: @_email
        unless @user
          fail!(
            :find_user,
            "Failed: No user found"
          )
        end
      end
  
      def authenticate
        result = @user&.authenticate(@_password)
        unless result
          fail!(
            :authenticate,
            "Failed: Unable to verify credentails"
          )
        end
      end
  
      def generate_token
        # exp = Time.now+24.hours.to_i 
        exp = Time.now.to_i + 4 * 3600
        @token = @_jwt_encoder.encode(exp: exp, data: {user_id: @user.id})
      end
    end
  end