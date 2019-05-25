class ApplicationController < ActionController::API
	include ActionController::HttpAuthentication::Token::ControllerMethods

	before_action :authenticate

	protected

  	def authenticate
    	authenticate_token || render_unauthorized
  	end

  	def authenticate_token
    	authenticate_with_http_token do |token, options|
    	  	@current_pokemon = Pokemon.find_by(api_key: token)
    	end
  	end

  	def render_unauthorized(realm = "Application")
    	self.headers["WWW-Authenticate"] = %(Token realm="#{realm}")
    	render json: 'Bad credentials', status: :unauthorized
	end
end

