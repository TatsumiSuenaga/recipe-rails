class Recipe < ActiveRecord::Base
  belongs_to :user
  attr_accessor :recipe_id
end
