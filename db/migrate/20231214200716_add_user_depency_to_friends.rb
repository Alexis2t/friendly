class AddUserDepencyToFriends < ActiveRecord::Migration[7.1]
  def change
    add_reference :friends, :user, foreign_key: true, null: false
  end
end
