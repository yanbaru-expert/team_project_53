class Text < ApplicationRecord
  has_many :read_progresses, dependent: :destroy
  has_many :read_progressed_users, through: :read_progresses, source: :user

  with_options presence: true do
    validates :genre
    validates :title
    validates :content
  end

  enum genre: {
    invisible: 0, # 非表示
    basic: 1,
    git: 2,
    ruby: 3,
    rails: 4,
    php: 5
  }

  RAILS_GENRE_LIST = %w[basic git ruby rails].freeze
  PHP_GENRE_LIST = %w[php].freeze

  def read_progressed_by?(user)
    read_progresses.exists?(user_id: user.id)
  end

  def self.genre_select(genre)
    if genre == "php"
      where(genre: PHP_GENRE_LIST)
    else
      where(genre: RAILS_GENRE_LIST)
    end
  end
end
