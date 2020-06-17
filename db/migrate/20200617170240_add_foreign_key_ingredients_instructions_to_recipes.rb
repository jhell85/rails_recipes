class AddForeignKeyIngredientsInstructionsToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ingredients, :recipes 
    add_foreign_key :instructions, :recipes
  end
end
