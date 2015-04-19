class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps null: false
    end
    rename_column "accounts","id","account_id"
  end
end
