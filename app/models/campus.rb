class Campus < ActiveRecord::Base
extend FriendlyId
attr_accessible :name, :short_name, :slug
friendly_id :short_name, use: :slugged
has_many :users
has_many :events
has_many :groups

 def slug=(value)
    if value.present?
      write_attribute(:slug, value)
    end
  end

end
