class Assignment < ActiveRecord::Base

  belongs_to :location
  belongs_to :person

  validates :roles, :location_id, presence: true
  validates :roles, uniqueness: true

end
