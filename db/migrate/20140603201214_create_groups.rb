class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :slug
      t.string :name
      t.text :description
      t.string :short_name
      t.timestamps
    end
  end
end
