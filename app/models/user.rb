class User < ActiveRecord::Base
  has_many :identities, dependent: :destroy
  has_many :ratings

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def name
    [firstname, lastname].join(" ")
  end

  def self.find_or_create_from_omniauth(auth)
    identity = Identity.find_or_initialize_by(provider: auth.provider, uid: auth.uid)

    identity.user = where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.firstname = auth.info.first_name
      user.lastname = auth.info.last_name
    end

    identity.save if identity.changed?
    identity.user
  end
end
