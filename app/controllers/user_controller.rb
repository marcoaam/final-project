class UserController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

  def edit
    @properties = current_user.properties
    @user = User.find(params[:id])
    @user.pictures.new
  end

  def update
    @user = User.find(params[:id])
    @user.update(params[:user].permit(:bio))
    @user.save
    if @user.pictures.none?
      @user.pictures.create(image: params[:user][:image])
    else
      @user.pictures.first.update(image: params[:user][:image])
    end
    flash[:notice] = 'Profile successfully saved'
    redirect_to '/'
  end

  def create
   
  end
end
