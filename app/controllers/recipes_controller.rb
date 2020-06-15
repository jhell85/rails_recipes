class RecipesController < ApplicationController

  def index 
    @recipes = Recipe.all 
    render :index
  end

  def new
    @recipe = Recipe.new
    render :new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    @recipe.image.attach(params[:recipe][:image])
    if @recipe.save
      flash[:notice] = "Recipe created successfully"
      redirect_to "/"
    else  
      flash[:notice] = "Error, recipe not saved"
      render :index
    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :author, :content, :image)
    end

end