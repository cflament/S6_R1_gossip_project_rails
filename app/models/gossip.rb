class Gossip < ApplicationRecord
    validates :title, presence: true, length: { minimum: 3, maximum: 14}
    validates :content, presence: true
    belongs_to :user
    has_many :gossip_tags
    has_many :tags, through: :gossip_tags
    has_many :comments

    def self.count 
        return self.all.size 
    end 

    def self.get_author_first_names
        author_array = []
        self.all.each do |g|
            author_array << g.user.first_name
        end 
        return author_array
    end 

    def self.get_titles
        title_array = []
        self.all.each do |g|
            title_array << g.title 
        end
        return title_array
    end 

end
