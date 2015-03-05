class Movie < ActiveRecord::Base
  belongs_to :director
  has_many :roles
  has_many :movies, :through => :roles
end
