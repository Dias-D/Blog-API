class Post < ApplicationRecord
    validates :title, :body, :user, presence: true
    belongs_to :user
end
