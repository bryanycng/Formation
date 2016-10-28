class Team < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :players

  validates :players, length: { maximum: 10 }
  validates :title, presence: true,
                    length: { minimum: 5 }
end
