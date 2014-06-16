class AddCampusToUsers < ActiveRecord::Migration
  def change
  add_column :users, :campus_id, :integer
  end
end
