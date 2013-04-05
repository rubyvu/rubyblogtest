class Api::BaseController < ApplicationController
  respond_to :json

  rescue_from Exception do |exception|
    render json: {status: 500, auth: false, message: exception.message}
  end


  def authenticate_user!
    @current_user = ApiKey.find_by_access_token(params[:access_token])
    unless @current_user
      render json: {status: 205, message: "must be login first"}
    end
  end

end
