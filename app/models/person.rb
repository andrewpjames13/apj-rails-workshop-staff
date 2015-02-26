class Person < ActiveRecord::Base

  has_many :assignments
  has_many :locations, through: :assignments
  has_many :roles, through: :assignments

  validates :last_name, presence: :true
  validates :title, presence: { message: " or first name can\'t be blank"}, unless: :first_name?
  validates :first_name, presence: { message: " or title can\'t be blank"}, unless: :title?

  def first_name?
    first_name.present?
  end

  def title?
    title.present?
  end

  def full_name
    "#{title} #{first_name} #{last_name}"
  end


end
