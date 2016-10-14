class Player < ApplicationRecord
	belongs_to :team

	validates :name, presence: true
	validates :file, presence: true
end
