class HomeController < ApplicationController

  def index
    @recipes = Recipe.all
    # binding.pry
    render :index
  end

end