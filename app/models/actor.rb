class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movie
  has_many :movie, through: :actor_movies

  validates :name, presence: true
  validates :age, presence: true

  def order_age
    self.order(:age, desc)
  end
end
