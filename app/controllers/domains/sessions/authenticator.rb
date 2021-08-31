module Sessions
    class Authenticator < Actionable::Action
      # extend Callable
      byebug
     
      step :find_user
      step :authenticate
      step :generate_token
  
      def initializer(
        email:,
        password:,
        jwt_encoder: Sessions::TokenEncoder
      )
        @_email= email
        @_password = password
        @_jwt_encoder = @jwt_encoder
        @token = nil
      end
  
      private
      def find_user
        @user = User.find_by email: @email
        unless @user
          fail!(
            :find_user,
            "Failed: No user found"
          )
        end
      end
  
      def authenticate
        result = @user&.authenticate(params[:password])
        unless result
          fail!(
            :authenticate,
            "Failed: Unable to verify credentails"
          )
        end
      end
  
      def generate_token
        @token = @jwt_encoder.encode(user_id: @user.id, { exp: Time.now+24.hours.to_i }) # this fails
      end
  
      # def authenticate_1
      #   # Business logic for authentication
      #   @user = User.find_by email: @email # if @user is blank?
      #   raise Exception.new("Failed: No user found")
      #   @user&.authenticate(params[:password]) # if this fails
      #   @jwt_encoder.encode(user_id: @user.id, { exp: Time.now+24.hours.to_i }) # this fails
      # end
    end
  end