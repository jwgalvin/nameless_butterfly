class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors
  has_many :actors, through: :actor_movies


  validates :title, presence: true
  validates :creation_year, presence: true
  validates :genre, presence: true

  def cast
    self.actors.order("age asc")
  end

  def add_actor(actor)
    actor.push(actor)
  end
end
