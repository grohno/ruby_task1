# プレイヤー(自分)に「0 ~ 2」を入力させるロジック
class Player
  def hand
    puts "数字を入力してください。"
    select_hand = ("0:グー, 1:チョキ, 2:パー").split(", ")
    puts select_hand
    input_hand = gets.to_i
    while true
      if input_hand == 0 || input_hand == 1 || input_hand == 2
        return input_hand
      else
        puts "もう一度数字を入力してください。"
        puts select_hand
        input_hand = gets.to_i
      end
    end
  end
end
# 敵が「0 ~ 2」の値をランダムで生成するロジック
class Enemy
  def hand
    random = Random.new()
    random.rand(3)
  end
end
# プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、その結果をコンソール上に出力するロジック
class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    if  player_hand == enemy_hand
      puts "あいこ"
      return true
  elsif (player_hand - enemy_hand + 3) % 3 == 2
      puts "相手の手は#{janken[enemy_hand]}です。あなたの勝ちです。"
      return false
    else
      puts "相手の手は#{janken[enemy_hand]}です。あなたの負けです。"
      return false
    end
  end
end
# じゃんけんゲームを実行するロジック
class Action
  def jankenpon
    player = Player.new
    enemy = Enemy.new
    janken = Janken.new
    next_game = true
    while next_game
        next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end
# クラス:Action のjankenponメソッドを呼び出し
action = Action.new
action.jankenpon
