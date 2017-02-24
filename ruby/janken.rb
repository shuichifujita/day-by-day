# coding: utf-8

# **** 仕様 **** #
# 入力
# ループに入る
# 空or整数以外ではないか
# 勝ち負け判定
# 続ける？やめる？
# break

# 数値でやってみよう
# **** end **** #

puts "じゃんけんをしましょう"

# functions
def isValid(input, janken)
  if !input.empty? && input.kind_of?(String)
    janken.each do |key, val|
      !!input.match(key.to_s)
    end
  end
end

def judge(you, enemy)
  you + enemy # janken.rb:26:in `judge': undefined method `+' for nil:NilClass (NoMethodError)
end

def shouldpaperreak()
  state = gets.chomp!
  if state == "y" || state == "n"
    return state == "n"
  else
    puts "無効な値だよ"
    return true
  end
end

# initialize
janken = { rock: 1, paper: 2, scissors: 3 }
messages = {
  :intro => "なにだすの？\nrock: #{janken[:rock]}\npaper: #{janken[:paper]}\nscissors: #{janken[:scissors]}",
  :error => "有効な値ではない。",
  :quit => "終了します。",
  :continue => "まだ続けるか？: y or n"
}
result = ""
continue = false

loop do
  # input
  puts messages[:intro]
  input = gets.chomp!

  # validation
  if input == "quit"
    puts messages[:quit]
    break
  elsif !isValid(input, janken)
    puts messages[:error]
    puts messages[:continue]

    if shouldBreak()
      puts messages[:quit]
      break
    end
  else
    you = janken[:"#{input}"]
    enemy = janken.sort_by{rand}[0][1]
    puts "You: #{you} Enemy: #{enemy}"

    # judgment
    result = judge(you, enemy)
    puts "Result: #{result}"
    puts messages[:continue]

    if shouldBreak()
      puts messages[:quit]
      break
    end
  end
end
