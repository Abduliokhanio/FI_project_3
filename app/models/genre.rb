class Genre < ApplicationRecord
    has_many :posts
    has_many :users, through: :posts
    
    scope :genre_filter, ->(val) { where("genre_name = ?", val)}

    def self.filter(val) #use syntax
        id_num = Genre.genre_filter(val)[0].id
        @posts = Post.post_filter(id_num)
    end

    # def self.filter(val) #use syntax
    #     arr = Genre.where(genre_name: val)[0].id
    #     Post.where(genre_id: arr)
    # end

end
