class Challenge < ApplicationRecord
    validates :title, :description, :tags, presence: true
    belongs_to :employee
    has_many :upvote
    has_many :collaborate
end
