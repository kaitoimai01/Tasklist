class Task < ApplicationRecord
    default_scope -> { order(deadline: :asc) }

    validates :title, presence: true, length: { maximum: 50 }
    validates :content, presence: true, length: { maximum: 255 }
    validates :deadline, presence: true
    validates :status, presence: true

    enum status: %i[Waiting Started Completed]
end
