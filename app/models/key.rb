class Key < ActiveRecord::Base
  validates_presence_of :name

  has_many :link_keys
  has_many :links, through: :link_keys
  belongs_to :company

end
