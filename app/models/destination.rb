class Destination < ApplicationRecord

    has_many :posts
    has_many :bloggers, through: :posts

    def most_liked_post
        self.posts.sort_by{
            |post| post.likes
        }.last
    end

    def most_recent_posts
        self.posts.last(5)
    end

    def average_age_of_bloggers
        total_age = 0
        self.posts.map{
            |post| post.blogger
        }.uniq.each{
            |blogger| total_age += blogger.age
        }

        total_bloggers = self.posts.map{
            |post| post.blogger
        }.uniq.size

        return total_age.to_f/total_bloggers

    end

end
