class IngredientsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new
    render :new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new(ingredient_params)
    if @ingredient.save
      render "recipes/show"
    else
      falsh[:notice] = "error ingredient was not saved"
      render :new 
    end

  end
  
  def show
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredient.find(params[:id])
    redner :show
  end

  def update
    @recipe = Recipe.find(params[:id])
    @ingredient = @recipe.ingredient.find(params[:id])
    if @ingredient.update(instruction_params)
      flash[:notice] = "Ingredients Successfully Updated!"
      render "ingredients/show"
    end
  end

  def destroy
    @ingredient = Ingredients.find(params[:id])
    @ingredient.destroy
    redirect_to "ingredients/show"
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end