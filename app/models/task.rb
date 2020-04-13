class Task < ApplicationRecord
  belongs_to :user
  has_many :task_labels, dependent: :destroy
  has_many :labels, through: :task_labels


  default_scope -> { order(priority: :desc) }

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
  validates :deadline, presence: true
  validates :status, presence: true
  validates :priority, presence: true

  enum status: %i[Waiting Started Completed]
  enum priority: %i[Low Medium High]
end
