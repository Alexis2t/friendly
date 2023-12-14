class AddDescriptionToFriend < ActiveRecord::Migration[7.1]
  def change
    add_column :friends, :description, :string, null: false, default: ""
  end
end
