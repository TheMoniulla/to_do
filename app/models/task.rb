class Task < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user

  def to_s
    name
  end

  def completed_for_display
    completed ? 'Yes' : 'No'
  end
end