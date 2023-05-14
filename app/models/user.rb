class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_secure_password
  has_one_attached :avatar
  has_many :messages
  has_many :conversations

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  # validates :avatar, attached: true

  before_save :downcase_email

  def avatar_url
    Rails.application.routes.url_helpers.url_for(avatar) if avatar.attached?
  end

  private
  def downcase_email
    self.email = email.downcase
  end
end
