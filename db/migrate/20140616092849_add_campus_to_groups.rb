class AddCampusToGroups < ActiveRecord::Migration
  def change
  add_column :groups, :campus_id, :integer
  end
end
