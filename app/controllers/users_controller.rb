class UsersController < ApplicationController
  
  def create
    @user = User.find_or_create_by facebook_id: params[:facebook_id]    
    if @user.new_record?
      error_render_method  @user.errors.first
    end
  end

end
