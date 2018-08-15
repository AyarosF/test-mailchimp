class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Inscription validée, un email de confirmation vous a été envoyé"
      redirect_to root_path
    else
      flash[:error] = "Tous les champs ne sont pas correctement renseignés"
      render 'new'
    end
  end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email)
      end
end
