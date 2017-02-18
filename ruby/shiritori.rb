# coding: utf-8
puts "しりとりしましょう"

def valid(str_ipt, str_last)
  str_ipt == "quit" || str_ipt.split("")[0] != str_last || str_ipt.match(/.*\ん$/)
end

input = gets.chomp!
ketsu = input[-1]
puts ketsu
puts valid(input, ketsu)

while valid(input, ketsu) do
  # 入力
  input = gets.chomp!

  # ケツを取る
  ketsu = input[-1]

  # 判定
  if valid(input, ketsu)
    break
  end

  puts "#{input} => #{ketsu}"
end

puts "The end."
