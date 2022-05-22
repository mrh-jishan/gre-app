class Api::ApiController < ActionController::API

  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def not_found
    render json: {error: 'not_found'}
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = decode_user_data(header)
      @user = User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      json_response({}, 401, e.message)
    rescue JWT::DecodeError => e
      json_response({message: 'Token not valid.'}, 401, 'Sorry! Invalid token')
    end
  end

  def index
    render :json => {status: :ok}
  end


  def decode_user_data(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end

  def encode_user_data(payload, exp = 2.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode payload, SECRET_KEY, "HS256"
  end

  def json_response(object, status = 200, message = '')
    render json: {
        data: object,
        success: (status == 200 || status == 201),
        message: message,
        code: status,
        time: Time.now.utc
    }, status: status
  end

end
