class Contact < ApplicationRecord

  belongs_to :user

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  def friendly_updated_at
    updated_at.strftime ("%A, %b %d")
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def japan_phone_number
    "+81 #{phone_number}"
  end
end
