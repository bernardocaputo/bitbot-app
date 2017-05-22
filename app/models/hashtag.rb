class Hashtag < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :company

  has_many :faqs_hashtags
  has_many :faqs, through: :faqs_hashtags
end
