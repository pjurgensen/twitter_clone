class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :handle
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    create_table :tweets do |t|
      t.text :message
      t.integer :user_id

      t.timestamps
    end

    create_table :follows do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
