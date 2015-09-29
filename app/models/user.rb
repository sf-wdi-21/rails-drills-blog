class User < ActiveRecord::Base

  has_secure_password

  # validations
  validates :email, presence: true, uniqueness: true, confirmation: true
  # email_confirmation is a virtual field added when confirmation: true
  # is set on the email attribute.  if nil the confirmation won't be done,
  # so validate its presence
  validates :email_confirmation, presence: true, if: :new_record?

  # associations
  has_many :articles

  # paperclip
  has_attached_file :avatar,
            styles: { medium: "300x300>", thumb: "100x100>" },
       default_url: ':style/missing-avatar.jpg'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # returns @user or false
  def self.confirm user_params
    user = User.find_by(email: user_params[:email])
    user.try(:authenticate, user_params[:password])
  end

end

