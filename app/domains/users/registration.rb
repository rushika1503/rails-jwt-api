module Users
    class Registration < Actionable::Action
      
      step :build
      step :validate
      step :create_user
    
      def initialize(params)
        super()
        @_params = params
      end
    
      def build
        @user = User.new @_params
      end
     
      def validate
        fail :name_invalid, "Name missing" unless @_params[:name].present?
        fail :username_invalid, "UserName missing" unless @_params[:username].present?
        fail :email_invalid, "email missing" unless @_params[:email].present?
        fail :pass_invalid, "pass missing" unless @_params[:password].present?
        fail :pasconf_invalid, "password conf missing" unless @_params[:password_confirmation].present?  
      end

      def create_user
        @user.save!
      end

      
    end
  end