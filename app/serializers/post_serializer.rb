class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at
  belongs_to :user
end
