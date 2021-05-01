class Challenge < ApplicationRecord
    validates :title, :description, :tags, presence: true
end
