class Title <ActiveRecord::Base
  has_many :titlefigures
  has_many :figures, through: :titlefigures
end
