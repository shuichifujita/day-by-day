# coding: utf-8

# **** 仕様 **** #
# 入力
# ループに入る
# 空or整数以外ではないか
# 勝ち負け判定
# 続ける？やめる？
# break
# **** end **** #

puts "じゃんけんをしましょう"

# functions
def isValid(input, hash)
  !input.empty? && input.kind_of?(String) && !!input.match(/[A-C]/)
end

def updateAttribute(you, janken)
  if you == janken[:A]
    {:strong => janken[:B], :draw => janken[:A], :weak => janken[:C]}
  elsif you == janken[:B]
    {:strong => janken[:C], :draw => janken[:B], :weak => janken[:A]}
  elsif you == janken[:C]
    {:strong => janken[:A], :draw => janken[:C], :weak => janken[:B]}
  end
end

def judge(enemy, attribute)
  state = ""
  if enemy == attribute[:strong]
    state = "Win."
  elsif enemy == attribute[:draw]
    state = "Draw."
  elsif enemy == attribute[:weak]
    state = "Lose"
  end
  state
end

def shouldBreak()
  state = gets.chomp!
  if state == "y" || state == "n"
    return state == "n"
  else
    puts "無効な値だよ"
    return true
  end
end

# initialize
janken = { A: :ぐー, B: :ちょき, C: :ぱー }
messages = {
  :intro => "なにだすの？\nA: #{janken[:A]}\nB: #{janken[:B]}\nC: #{janken[:C]}",
  :error => "有効な値ではない。",
  :quit => "終了します。",
  :continue => "まだ続けるか？: y or n"
}
attribute = {
  :strong => "",
  :draw => "",
  :weak => ""
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
    attribute = updateAttribute(you, janken)
    result = judge(enemy, attribute)
    puts "Result: #{result}"
    puts messages[:continue]

    if shouldBreak()
      puts messages[:quit]
      break
    end
  end
end
