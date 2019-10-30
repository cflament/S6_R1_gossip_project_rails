class Tag < ApplicationRecord
    validates :title, presence: true, length: { maximum: 100}
    has_many :gossip_tags
    has_many :gossips, through: :gossip_tags 
end
