class Link < ActiveRecord::Base
  validates :identifier, presence: true
  validates :url_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  belongs_to :url, dependent: :delete
end
