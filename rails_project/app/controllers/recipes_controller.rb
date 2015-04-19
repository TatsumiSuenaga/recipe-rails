class RecipesController < ApplicationController
  
  def index
    @users = User.find(params[:user_id])
    @recipes = @users.recipes.order("recipe_id ASC")
  end

  def show
    @users = User.find(params[:user_id])
    @recipes = @users.recipes.find(params[:id])
  end


  def new
   @users = User.find(params[:user_id])
   @recipes = @users.recipes.new
  end
 
  def create
    @users = User.find(params[:user_id])
    @recipes = @users.recipes.new(recipe_params)
    if @recipes.save       
	flash[:notice] = "Recipe created successfully."
 	redirect_to(:action => 'index')
    else
        render('new')
    end
  end
    
  def edit 
   @users = User.find(params[:user_id])
   @recipes = @users.recipes.find(params[:id])
  end

  def update
        @users = User.find(params[:user_id])
        @recipes = @users.recipes.find(params[:id])
        if @recipes.update_attributes(recipe_params)
	    flash[:notice] = "Recipe updated successfully."
            redirect_to(:action => 'show', :id => @recipes.id)
        else
            render('edit')
        end
  end

  def delete
	@users = User.find(params[:user_id])
	@recipes = @users.recipes.find(params[:id])
  end

  def destroy
	@users = User.find(params[:user_id])
	@recipes = @users.recipes.find(params[:id])
        @recipes.destroy
        flash[:notice] = "Recipe destroyed successfully."
        redirect_to(:action => 'index')
 end

private
  def recipe_params
      params.require(:recipes).permit(:recipeName,:recipeDescription)
  end


end
