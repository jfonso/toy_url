class Url < ActiveRecord::Base
  validates :original, presence: true
  has_one :link
  attr_reader :custom

  def self.create_link( original, custom = nil )
    url = Url.create( original: original )

    identifier = custom.blank? || !Link.where(identifier: custom).empty? ?
        url.id.to_s(36) : custom

    if Link.where(identifier: identifier).empty?
      Link.create( identifier: identifier, url: url)
    else
      url.destroy
      create_link( original )
    end
  end

  def update_link( original, custom = nil )
    if custom.blank? || !Link.where(identifier: custom).empty?
      update( original: original )
    else
      link.update(identifier: custom)
      update( original: original )
    end
  end
end
