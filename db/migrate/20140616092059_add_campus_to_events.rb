class AddCampusToEvents < ActiveRecord::Migration
  def change
  add_column :events, :campus_id, :integer
  end
end
