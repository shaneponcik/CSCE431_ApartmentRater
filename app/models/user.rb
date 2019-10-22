class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def is_admin
    if AdminTable.where(:user_id => self.id).size > 0
      return true
    else
      return false
    end
  end
end
