class Api::SessionsController < Api::BaseController
	def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.api_key
        user.api_key.reset_token
      else
        user.create_api_key unless user.api_key
      end
    end

    hash = {}
    if current_user 
      hash = {
              status: 200,
              access_token: current_user.api_key.access_token,
              message: "Sign in successfully."
      }
    else
      hash = {status: 205, user: {email: params[:email]}, message: "Invalid email or password."}
    end
    render :json => hash
  end
end
