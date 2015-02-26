class Assignment < ActiveRecord::Base

  belongs_to :location
  belongs_to :person

  validates :roles, uniqueness: true 

end
