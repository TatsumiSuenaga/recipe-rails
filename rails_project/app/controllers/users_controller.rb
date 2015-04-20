class UsersController < ApplicationController
<<<<<<< HEAD
  
  layout 'logged_in'

  def index
   @users = User.order("user_id ASC")
  end

  def show  
  @users = User.find(params[:id])
  end
  
  def edit 
    @users = User.find(params[:id])
  end

  def update
        @users = User.find(params[:id])
        if (user_params[:first_name].length > 25 || user_params[:last_name].length > 50 || user_params[:bio].length > 2000)
          flash[:notice] = "Input too long"
          render('edit')
        elsif(user_params[:first_name] != "" && user_params[:last_name] != "" && user_params[:bio] != "")
          if @users.update_attributes(user_params)
	      flash[:notice] = "Profile updated successfully."
              redirect_to(:action => 'show', :id => @users.id)
          else
              flash[:notice] = "There was an error updating your profile"
              render('edit')
          end
        else
          flash[:notice] = "You must include a name or bio"
          render('edit') 
        end
  end

  def delete
  end 

  def destroy
  end
  
private
  def user_params
      params.require(:user).permit(:first_name,:last_name, :bio)
  end

=======
    
    layout 'logged_in'
    
    def index
        @users = User.order("user_id ASC")
    end
    
    def show
        @users = User.find(params[:id])
    end
    
    def edit
        @users = User.find(params[:id])
    end
    
    def update
        @users = User.find(params[:id])
        if (user_params[:first_name].length > 25 || user_params[:last_name].length > 50 || user_params[:bio].length > 2000)
            flash[:notice] = "Input too long"
            render('edit')
            elsif(user_params[:first_name] != "" && user_params[:last_name] != "" && user_params[:bio] != "")
            if @users.update_attributes(user_params)
                flash[:notice] = "Profile updated successfully."
                redirect_to(:action => 'show', :id => @users.id)
                else
                flash[:notice] = "There was an error updating your profile"
                render('edit')
            end
            else
            flash[:notice] = "You must include a name or bio"
            render('edit')
        end
    end
    
    def delete
    end
    
    def destroy
    end
    
    private
    def user_params
        params.require(:user).permit(:first_name,:last_name, :bio)
    end
    
>>>>>>> 01a3e5cad92606522707d32e1601b44ad042f81f
end
