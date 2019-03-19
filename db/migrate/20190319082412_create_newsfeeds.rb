class CreateNewsfeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :newsfeeds do |t|
      t.integer :user_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
