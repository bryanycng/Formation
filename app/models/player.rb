class Player < ApplicationRecord
	has_and_belongs_to_many :teams

	validates :name, presence: true, uniqueness: true
	validates :file, presence: true
	validates :element, presence: true
	validates :star, presence: true
end
