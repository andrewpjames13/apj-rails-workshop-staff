class Assignment < ActiveRecord::Base

  belongs_to :location
  belongs_to :person

  validate :unique_location
  validates :location_id, :person_id, :roles, presence: true

  def unique_location
    if person.assignments.find_by(location_id: location_id, roles: roles)
      errors.add(:base, "People cannot be assigned to the same role in the same location")
    end
  end

end
