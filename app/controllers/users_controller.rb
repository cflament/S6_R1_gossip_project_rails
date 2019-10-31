class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(email: params[:email], password: params[:password], city_id: rand(1..10))

    if @user.save
      puts "User #{@user} saved"
      flash[:success] = "Session créée, bienvenu.e dans la communauté des potins !"
      #création d'une session
      session[:user_id] = @user.id
      redirect_to root_path
    else
      puts @user
      puts "user not saved due to errors"
      puts @user.errors.full_messages
      render new_user_path
    end 
  end

  def update
  end

  def show
    @user = User.all.find(params[:id].to_i)
  end

  def destroy
  end

  def edit
  end
end
