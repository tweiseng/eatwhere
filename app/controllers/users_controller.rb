class UsersController < ApplicationController
	def new
		@user = User.new
	end

#find out why the action below and the session action does not route correctly for sign in
	# def sign
		
	# end

	def create
	byebug		
		@user = User.new
		@user.name = params[:user][:name]
		@user.email = params[:user][:email]
		@user.password = params[:user][:password]
		@user.save
		respond_to do |format|
			if @user.save
				format.html {redirect_to root_path, notice: 'You successfully created an account!'}
			else
				format.html {render:new, notice: 'Something went wrong, please make sure your details are complete'}
			end
		end
	end

	def destroy
		new
	end



	# def session
	# 	@user = User.find_by_email(params[:user][:email])
	# 	if @user.password == params[:user][:password]
	# 		cookies[:uid] = @user.id
	# 		cookies[:email] = @user.email
	# 	else
	# 		flash[:notice] ='Email or password is invalid'
	# 		redirect_to signin_path
	# 	end
	# end

private
	# def permit_params
	#       params.require(:user).permit(:name, :email, :password, :birthday, :image, :role)
	# end		
end
