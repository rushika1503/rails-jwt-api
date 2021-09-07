module Sessions
  class TokenVerifier < Actionable::Action
    step :parse_header
    step :parse_token
    step :verify # not sure if token is expired or blacklisted

    def initialize(
      header,
      jwt_decoder = Sessions::TokenEncoder
      )
      @_header = header
      @_jwt_decoder = jwt_decoder
      @decoded = nil
    end
    
    def parse_header
      byebug
      @_header = @_header.split(' ').last
      unless @_header
        fail!(
          :parse_header,
          "Failed: No user found"
        )
      end
      byebug
    end
    def parse_token
      @decoded = @_jwt_decoder.decode(@_header)
      byebug
    end
    def verify
    end
  end
end