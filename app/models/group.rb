class Group < ActiveRecord::Base
extend FriendlyId
attr_accessible :name, :short_name, :slug, :description
friendly_id :short_name, use: :slugged
has_many :users
has_many :events
has_many :microposts, :dependent => :destroy
belongs_to :campus
end
