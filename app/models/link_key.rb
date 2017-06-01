class LinkKey < ActiveRecord::Base
  validates_presence_of :link_id, :key_id

  belongs_to :link
  belongs_to :key
end
