class User < ApplicationRecord
  # Include default users modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # after_create :send_congra_mail
  # attr_accessible :cached_failed_attempts
  validates :email, presence: true

  devise :database_authenticatable, :registerable, :trackable, :lockable,
         :recoverable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :images, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :activities, dependent: :destroy

  mount_uploader :image, AvatarUploader


  def self.logins_before_captcha
    3
  end


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["users.facebook_data"] && session["users.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  # def send_congra_mail
  #   user = self
  #   Resque.enqueue(WelcomeMail, [user])
  # end

end
