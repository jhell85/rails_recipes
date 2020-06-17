class Recipe < ApplicationRecord 
  has_many :instructions, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_one_attached :image
  validates_presence_of :name, :author, :content, :image
  validates_length_of :content, minimum: 50
  before_save(:titleize_recipe)

  private
    def titleize_recipe
      self.name = self.name.titleize
    end
end