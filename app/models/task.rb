class Task < ApplicationRecord
  # Associations
  belongs_to :user

  # Validations
  validates :title, presence: true
  validates :content, presence: true
end
