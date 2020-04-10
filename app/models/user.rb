class User < ApplicationRecord
  before_destroy :at_least_one_admin_user_exists?

  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

  has_secure_password

  has_many :tasks, dependent: :destroy

  private

  def at_least_one_admin_user_exists?
    return unless self.admin?
    throw :abort if User.where(admin: true).size == 1
  end
end
