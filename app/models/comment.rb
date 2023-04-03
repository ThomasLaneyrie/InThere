class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :product

    validates :title, presence: true
    validates :content, presence: true
    validates :note, presence: true
end
