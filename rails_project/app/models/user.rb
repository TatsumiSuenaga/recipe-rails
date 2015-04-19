class User < ActiveRecord::Base
  has_many :recipes
  belongs_to :account
  attr_accessor :user_id
end
