class UserController < ApplicationController
  
  def register
    @user = User.find_or_create_by facebook_id: params[:facebook_id]

    render :json => { :user_id => @user.id }
  end

end
