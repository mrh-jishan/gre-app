class Api::V1::SessionsController < Api::ApiController

  def create
    @user = User.find_by(username: params[:username])
    if @user.present? && @user.authenticate(params[:password])
      token = encode_user_data(user_id: @user.id)
      json_response({:token => token, :user => @user}, 200)
    else
      json_response({}, 401, "Sorry! You are not registered to our app.")
    end
  end

end
