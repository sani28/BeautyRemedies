class UsersController < ApplicationController
  def new
  @user = User.new
  end
  def create
  @user =  User.new user_params

  if @user.save
    # If the user is successfuly created, immediately store their id in the
    # session hash effectively signing them in.
    session[:user_id] = @user.id
    # The flash is temporary that will last until the next
    # request ends. We typically use it to store information
    # to display to the user about what just happened.

    # flash[:notice] = 'Thank you for signing up!'
    # When using `redirect_to`, we can include the flash as an argument
    # instead of writing in a single as above ð
    redirect_to root_path, notice: 'Thank you for signing up!'
  else
    # Sometimes we want the flash message to appear in the current request and
    # not the next one. User `flash.now[...]` in that situation.
    flash.now[:alert] = @user.errors.full_messages.join(', ')
    render :new
  end
end

def show
  @user = User.find params[:id]
end

  def edit
    @user = User.find params[:id]
  end

def update
  @user = User.find params[:id]
  u = User.new
  u.avatar = params[:file]
  if @user.update user_params
    redirect_to user_path(@user)
  else
    render :edit
  end
end

private
def user_params
  params.require(:user).permit(
    :first_name,
    :last_name,
    :email,
    :password,
    :password_confirmation,
    :age,
    :country,
    :avatar
  )
end
end
