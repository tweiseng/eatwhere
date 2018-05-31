class SessionsController < ApplicationController

	def new
	end

	def create		
		# byebug
		@user = User.find_by_email(params[:session][:email])
		if @user == nil
		elsif @user.authenticate(params[:session][:password])!= false
			cookies[:uid] = @user.id
			cookies[:email] = @user.email
		end
		
		if cookies[:uid]!=""
			flash[:notice]= 'You are logged in'
			redirect_to root_path 
		elsif cookies[:uid]==""
			flash[:notice]= 'Invalid email or password'
			render :new
		end
	end

	def destroy
		cookies[:uid] = nil
		cookies[:email] = nil
		flash[:notice] = "You signed out!"
		redirect_to root_path
	end

	def sign_in(user)
		cookies[:uid] = user.id
		cookies[:email] = user.email
	end

	def create_from_omniauth
	  auth_hash = request.env["omniauth.auth"]
	  authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

		  # if: previously already logged in with OAuth
		  if authentication.user
		    user = authentication.user
		    authentication.update_token(auth_hash)
		    @next = root_url
		    @notice = "Signed in!"
		  # else: user logs in with OAuth for the first time
		  else
		    user = User.create_with_auth_and_hash(authentication, auth_hash)
		    # you are expected to have a path that leads to a page for editing user details
		    @next = root_path
		    @notice = "User created. Please confirm or edit details"
		  end

		  sign_in(user)
		  redirect_to @next, :notice => @notice
	end
	
end