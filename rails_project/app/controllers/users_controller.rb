class UsersController < ApplicationController
  
  def index
   @users = User.order("user_id ASC")
  end

  def show  
  @users = User.find(params[:id])
  end
  
  def new
	@users = User.new
  end 
  
  def create
	@users = User.new(user_params)
      if @users.save
        redirect_to(:action => 'index')
    else
        render('new')
    end
    if @users.save
         flash[:notice] = "Recipe created successfully."
    end
  end
  
  def edit 
    @users = User.find(params[:id])
  end

  def update
        @users = User.find(params[:id])
        if @users.update_attributes(user_params)
	    flash[:notice] = "User updated successfully."
            redirect_to(:action => 'show', :id => @users.id)
        else
            render('edit')
        end
           
  end
  def delete
  end 

  def destroy
  end
  
private
  def user_params
      params.require(:user).permit(:first_name,:last_name, :bio, :email)
  end

end
