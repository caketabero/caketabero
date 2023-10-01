class Cake < ApplicationRecord
    validates :user_id, presence: true
    validates :genre_id, presence: true
    validates :cake_name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 255 }
    validates :explanation, presence: true, length: { minimum: 1, maximum: 255 }
    validates :stock, presence: true
    validates :cost, presence: true
    validates :created_name, presence: true, length: { minimum: 1, maximum: 255 }
    validates :updated_name, presence: true, length: { minimum: 1, maximum: 255 }
end
