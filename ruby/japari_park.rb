# coding: utf-8

def valid(str_ipt)
  str_ipt == "quit" || str_ipt == nil
end

loop do
  puts "\nきみはなにが得意なフレンズなのー？"

  # 入力
  puts "=> Enter your special skill or \"quit\""
  input = gets.chomp!

  if valid(input)
    puts "\nまたねー！"
    break
  end

  if input.empty?
    puts "\nあなた、なんにもできないのね。"
  else
    puts "\nすごーい！きみは#{input}が得意なフレンズなんだね！"
  end
end