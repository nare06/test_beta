class UsersController < ApplicationController
 #authorize_resource class: false
 before_filter :set_user, only: [:show, :edit, :update]
  before_filter :validate_authorization_for_user, only: [:edit, :update]
  before_filter :authenticate_user!, only: [:index, :edit, :update,:show, :destroy, :following, :followers, :preferences]
  load_and_authorize_resource :only => [:edit,:update,:destroy]
  #load_and_authorize_resource
  #skip_load_and_authorize_resource :only => :new
def index
 @title = "All Users"
 @users = User.all.page params[:page]
 
end
def show
    @user = User.friendly.find(params[:id])
    @micropost = @user.microposts.new
    #@micropost = @user.microposts.build if signed_in?
    @microposts = @user.microposts.paginate(:page => params[:page]) 
  end  
def new
@user = User.new
  end
def create
@user = User.new(user_params)
@user.role = "user"

if @user.save
  sign_in @user
 flash[:success] = "welcome to the Kampusbee.com!"
else
@title = "Sign up"
render 'new'
end
end
def edit
@user = User.friendly.find(params[:id])
@title = "Edit User"
@auth = @user.authorizations

end
def update
  @user = User.friendly.find(params[:id])
  if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated"
      sign_in @user
      redirect_to @user
  else 
  flash[:error] = "Couldn't update"
  redirect_to @user
  end
end

def jstest
end
def preferences
 @user = current_user
end
  def following
    @title = "Following"
    @user = User.friendly.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end
  def followers
    @title = "Followers"
    @user = User.friendly.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,:role)
    end
    def set_user
      @user = User.friendly.find(params[:id])
    end

    def validate_authorization_for_user
       redirect_to root_path unless @user == current_user
    end
end
