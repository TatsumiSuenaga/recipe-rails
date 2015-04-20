class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 50
      t.string "bio"
      t.column "account_id", :integer
      t.timestamps null: false
    end
    add_index "users","account_id" 
    rename_column "users","id", "user_id"
  end
end
