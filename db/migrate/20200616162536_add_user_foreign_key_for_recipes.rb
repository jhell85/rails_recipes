class AddUserForeignKeyForRecipes < ActiveRecord::Migration[6.0]
  def change
    change_table :recipes do |t|
      t.belongs_to :user, foreign_key: true
    end
  end
end
