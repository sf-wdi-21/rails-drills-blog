class User < ActiveRecord::Base

  # validations
  validates :email, presence: true, uniqueness: true, confirmation: true
  has_secure_password

  # associations
  has_many :articles

  # returns @user or false
  def self.confirm(params)
    user = User.find_by(email: params[:email])
    user.try(:authenticate, params[:password])
  end

end
