class CreateFriends < ActiveRecord::Migration[7.1]
  def change
    create_table :friends do |t|
      t.string :name
      t.integer :price_per_day

      t.timestamps
    end
  end
end
