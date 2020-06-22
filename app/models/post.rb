class Post < ApplicationRecord
    #will link to a user
    belongs_to :user

    validates :post, presence: true
end
