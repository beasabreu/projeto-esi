class RegistrationsController < ApplicationController 

def loginTest
  @User = User.new
  user = User.find_by(email: 'teste@gmail.com')
  if !user.present?
    @user = User.new(name: 'Teste', email: 'teste@gmail.com', password: '1234').save!
    user = User.find_by(email: 'teste@gmail.com')
  end
  session[:user_id] = user.id
  redirect_to root_path
end

def login
  @User = User.new
end

def makeLogin
  @new_User = User.new(user_params)
  user = User.find_by(email: @new_User[:email])
  if user.present? 
    if user[:password] == @new_User[:password]
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path, notice: 'Senha incorreta! Tente novamente.'
    end
  else
    redirect_to login_path, notice: 'Usuário não cadastrado!'
  end
end

def new
  @User = User.new
end

def create
  @User = User.new(user_params)
  if @User.save
    session[:user_id] = @User.id
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity, content_type: "text/html"
    headers["Content-Type"] = "text/html"
  end
end

private

def user_params
  params.require(:user).permit(:name, :email, :password)
end
end