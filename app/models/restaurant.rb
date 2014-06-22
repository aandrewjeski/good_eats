class Restaurant < ActiveRecord::Base
  has_many :reviews
  validates :name,
    presence: true,
    uniqueness: true
  validates :address,
    presence: true,
    uniqueness: true
  validates :city,
    presence: true
  validates :state,
    presence: true
  validates :zipcode,
    presence: true,
    length: { is: 5 }
  validates :description,
    presence: true
  validates :category,
    inclusion: { in: %w(american indian italian thai chinese fusion mexican bbq korean mediterranean asian other),
      message: "%{value} is not a valid category." }
end
