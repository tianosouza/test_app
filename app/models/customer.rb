class Customer < ApplicationRecord
  has_many :orders

  validates :adrdress, presence: true
  
  def full_name
    "Sr #{name}"
  end
end
