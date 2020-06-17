class CreateInstructions < ActiveRecord::Migration[6.0]
  def change
    create_table :instructions do |t|
      t.text :steps
      t.column(:recipe_id, :integer)
    end
  end
end
