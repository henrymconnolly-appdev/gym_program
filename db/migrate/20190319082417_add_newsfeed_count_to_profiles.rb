class AddNewsfeedCountToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :newsfeeds_count, :integer
  end
end
