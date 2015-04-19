class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :recipeName, :limit => 50
      t.string :recipeDescription, :limit => 2000
      t.integer :user_id
      t.timestamps null: false
    end
    add_index "recipes", "user_id"
    rename_column "recipes", "id", "recipe_id"
  end
end
