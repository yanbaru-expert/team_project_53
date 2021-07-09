# texts, movies テーブルを再生成（関連付くテーブルを含む）
%w[texts movies].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name} RESTART IDENTITY CASCADE")
end

require "csv"

# テキスト教材のCSVを読み込む
CSV.foreach("db/csv_data/text_data.csv", headers: true) do |row|
  Text.create!(row.to_h)
end
puts "テキスト教材のCSVインポートに成功しました。"

# 動画教材のCSVを読み込む
CSV.foreach("db/csv_data/movie_data.csv", headers: true) do |row|
  Movie.create!(row.to_h)
end
puts "動画教材のCSVインポートに成功しました。"

email = "test@example.com"
password = "password"

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: email) do |user|
  user.password = password
  puts "ユーザーの初期データインポートに成功しました。"
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?