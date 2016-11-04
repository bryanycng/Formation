class Player < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :file, presence: true
	validates :element, presence: true
	validates :star, presence: true
end
