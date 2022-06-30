class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i, # the expiration time
        },
        ENV['SECRET_KEY_BASE'], # the secret key
        "HS256" # the encryption algorithm
      )
      render json: { jwt: jwt, username: user.username, user_id: user.id }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
