class ReadProgress < ApplicationRecord
  belongs_to :user
  belongs_to :text

  validates :user_id, uniqueness: {
    scope: :text_id,
    message: "は同じテキスト教材を２回以上読破済みにはできません"
  }
end
