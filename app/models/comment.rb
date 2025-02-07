class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  validates :content, presence: tru
end
