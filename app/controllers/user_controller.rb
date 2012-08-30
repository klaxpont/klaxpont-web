class UserController < ApplicationController
  
  def register
    @user = User.find_or_create_by facebook_id: params[:facebook_id]
    
    if @user.new_record?
      @errors = @user.errors
      render :partial => 'shared/errors', :status => 400
    else
      render :json => { :user_id => @user.id }
    end
  end

end
