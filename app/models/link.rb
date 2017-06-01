require "pg_search"
include PgSearch

class Link < ActiveRecord::Base
  validates_presence_of :website

  has_many :link_keys
  has_many :keys, through: :link_keys
  belongs_to :company

  # include PgSearch
  pg_search_scope :search, :against => [:website] #procura apenas no link
end
