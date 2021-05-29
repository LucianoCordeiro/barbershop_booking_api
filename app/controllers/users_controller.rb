class UsersController < AuthorizationController
  before_action :logged_in?, only: :me

  def signup
    @user = User.new(email: params[:email], password: params[:password])

    if @user.save
      token = encode_token({user_id: @user.id})
      render json: {
        token: token,
        user: @user
      }
    else
      render json: {error: "Nao foi possível criar o usuário"}
    end
  end

  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {
        token: token,
        user: @user
      }
    else
      render json: {error: "Email e/ou senha inválidos"}
    end
  end

  def me
    render json: {me: current_user}
  end
end
