class ActorController < ApplicationController

  def self.search(search_params)
    where("name ILIKE ?", "%#{search_params}%")
  end
end
