class Api::V1::RegistrationsController < Api::ApiController

  def create
    @user = User.new(user_params)
    if @user.save
      json_response({:user => @user.as_json(except: [:password_digest])}, 200)
    else
      json_response(@user.errors.full_messages, 401, @user.errors.full_messages.first)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation)
  end
end
