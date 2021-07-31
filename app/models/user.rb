class User < ApplicationRecord
  has_many :read_progresses, dependent: :destroy
  has_many :read_progressed_texts, through: :read_progresses, source: :text

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: "test@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
