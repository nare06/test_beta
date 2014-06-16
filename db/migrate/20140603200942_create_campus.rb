class CreateCampus < ActiveRecord::Migration
  def change
    create_table :campus do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :group_id
      t.string :slug
      t.string :name
      t.string :short_name
      t.timestamps
    end
  end
end
