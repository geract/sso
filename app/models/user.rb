class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :login_providers, dependent: :destroy
  belongs_to :client

  enum :role, [:client, :admin]

  def valid_password?(password)
    password.blank? ? true : super
  end

  def password_required?
    new_record? ? false : super
  end
end
