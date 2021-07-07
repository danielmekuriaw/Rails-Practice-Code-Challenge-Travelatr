class Blogger < ApplicationRecord

    has_many :posts
    has_many :destinations, through: :posts

    validates :name, presence: true, uniqueness: { message: "needs to be unique" }
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: { minimum: 30}

    def total_likes
        sum = 0
        self.posts.each{
            |post| sum += post.likes.to_i
        }
        sum
    end

    def most_liked_post
        self.posts.sort_by{
            |post| post.likes
        }.last
    end

    def top_5_destinations
        self.posts.sort_by{
            |post| post.likes
        }.map{
            |post| post.destination
        }.uniq.last(5)
    end

end
