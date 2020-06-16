class RecipesController < ApplicationController
  
  before_action :only => [:show] do
    redirect_to "/" unless(current_user)
  end

  before_action :only => [ :edit, :destroy] do
    redirect_to new_user_session_path unless(current_user && current_user.admin) || (current_user.id == Recipe.find(params[:id]).user_id)
  end


  def index 
    @recipes = Recipe.all 
    
    render :index
  end

  def new
    @recipe = Recipe.new
    render :new
  end

  def create
    @recipe = Recipe.new(recipe_params.merge(user_id: current_user.id))
    @recipe.image.attach(params[:recipe][:image])
    if @recipe.save
      flash[:notice] = "Recipe created successfully"
      redirect_to "/"
    else  
      flash[:notice] = "Error, recipe not saved"
      render :index
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    render :show
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:notice] = "Recipe successfully updated!"
      render :show
    else
      render :edit
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render :edit
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "This recipe successfully deleted!"
    redirect_to "/"
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :author, :content, :image)
    end

end