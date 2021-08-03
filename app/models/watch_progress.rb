class WatchProgress < ApplicationRecord
  validates :user_id, uniqueness: {
    scope: :movie_id,
    message: "は同じ動画教材を２回以上読破済みにはできません"
  }
end
