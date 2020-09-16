class Post < ApplicationRecord
    belongs_to :user
    belongs_to :genre

    validates :title, :description, presence: true 
    validates :title, :description, length: { minimum: 2 }

    scope :post_filter, -> (id_num){ where("genre_id = ?", id_num) }

end
