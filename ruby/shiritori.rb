# coding: utf-8
default_word = "しりとりしましょう"

input = gets
input.chomp!

while input != "quit" do
  # ケツを取る
  ketsu = input.split("").reverse[0].to_s
  puts ketsu

  # 入力
  input = gets
  input.chomp!

  # 判定
  if input == "quit" || input.split("")[0] != ketsu || input.match(/.*\ん$/)
    break
  end
end

puts "The end."