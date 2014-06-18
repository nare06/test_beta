class LinkGroupsDomains < ActiveRecord::Migration
  def change
  create_table :domains_groups do |t|
      t.integer :domain_id
      t.integer :group_id
      end
  end
end
