class Group < ActiveRecord::Base
extend FriendlyId
attr_accessible :name, :short_name, :slug, :description, :contact_name, :contact_phone, :email,
                :microposts, {:domain_ids =>[]}
                
friendly_id :short_name, use: :slugged
validates :name, presence: true
validates :campus_id, presence: true
has_many :users
has_many :events
has_and_belongs_to_many :domains   #topics
has_many :microposts, :dependent => :destroy
belongs_to :campus
end
