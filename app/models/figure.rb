class Figure <ActiveRecord::Base
  has_many :landmarks
  has_many :titlefigures
  has_many :titles, through: :titlefigures
end
