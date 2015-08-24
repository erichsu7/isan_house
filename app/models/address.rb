class Address < ActiveRecord::Base
  validates :line1, :city, :state, :zip, presence: true
  validates :state, length: { is: 2 }
  validates :zip, numericality: { only_integer: true }, length: { is: 5 }

  belongs_to :addressable, polymorphic: true
end
