require 'dxruby'

Window.width = 1920
Window.height = 1200
Window.windowed = false

walls = [
    Sprite.new(0, 0, Image.new(1920, 20, C_GREEN)),
    Sprite.new(0, 0, Image.new(20, 1200, C_GREEN)),
    Sprite.new(1900, 0, Image.new(20, 1200, C_GREEN)),
    Sprite.new(0, 1180, Image.new(1920, 20, C_GREEN))
]

blocks = [
    Sprite.new(500, 500, Image.new(20, 300, C_GREEN))
]

attack_go_up_x = 0
attack_go_up_y = 9
spead = 0.1
player_attack = []
player_attack_true1 = false
player_attack_true2 = false
player_attack_true3 = false
player_attack_true4 = false

player = Sprite.new(960, 600, Image.new(50, 50, C_WHITE))
player_go_up_x = 0
player_go_up_y = 9

player2 = Sprite.new(100, 600, Image.new(50, 50, C_BLUE))
player2_go_up_x = 0
player2_go_up_y = 9

player3 = Sprite.new(1400, 600, Image.new(50, 50, C_RED))
player3_go_up_x = 0
player3_go_up_y = 9


Window.loop do
    player.draw
    player2.draw
    player3.draw
    Sprite.draw(walls)
    # Sprite.draw(blocks)
    Window.draw_font(800, 800, "プレイヤー角度#{player.angle}\nプレイヤーｘ速度#{player_go_up_x}\nプレイヤーｙ速度#{player_go_up_y}\n攻撃配列#{player_attack.size}\n攻撃ｘ#{attack_go_up_x}\n攻撃ｙ#{attack_go_up_y}",Font.default)

    #プレイヤー１
    if Input.key_down?(K_RIGHT)
        player.angle += 1
        player.angle = player.angle % 360
        if (player.angle >= 1 && player.angle <= 90)
            player_go_up_x += spead
            player_go_up_y -= spead
            attack_go_up_x += spead
            attack_go_up_y -= spead
        end
        if (player.angle >= 91 && player.angle <= 180)
            player_go_up_x -= spead
            player_go_up_y += spead
            attack_go_up_x -= spead
            attack_go_up_y += spead
        end
        if (player.angle >= 181 && player.angle <= 270)
            player_go_up_x += spead
            player_go_up_y -= spead
            attack_go_up_x += spead
            attack_go_up_y -= spead
        end
        if (player.angle >= 271 && player.angle <= 360)
            player_go_up_x -= spead
            player_go_up_y += spead
            attack_go_up_x -= spead
            attack_go_up_y += spead
        end
    end
    if Input.key_down?(K_LEFT)
        player.angle -= 1
        player.angle = player.angle % 360
        if (player.angle >= 1 && player.angle <= 90)
            player_go_up_x -= spead
            player_go_up_y += spead
            attack_go_up_x -= spead
            attack_go_up_y += spead
        end
        if (player.angle >= 91 && player.angle <= 180)
            player_go_up_x += spead
            player_go_up_y -= spead
            attack_go_up_x += spead
            attack_go_up_y -= spead
        end
        if (player.angle >= 181 && player.angle <= 270)
            player_go_up_x -= spead
            player_go_up_y += spead
            attack_go_up_x -= spead
            attack_go_up_y += spead
        end
        if (player.angle >= 271 && player.angle <= 360)
            player_go_up_x += spead
            player_go_up_y -= spead
            attack_go_up_x += spead
            attack_go_up_y -= spead
        end
    end
    if Input.key_down?(K_UP)
        if (player.angle >= 1 && player.angle <= 90) || (player.angle >= 91 && player.angle <= 179)
            player.x += player_go_up_x
        end
        if (player.angle >= 91 && player.angle <= 180) || (player.angle >= 181 && player.angle <= 269)
            player.y += player_go_up_y
        end
        if (player.angle >= 181 && player.angle <= 270) || (player.angle >= 271 && player.angle <= 359)
            player.x -= player_go_up_x
        end
        if (player.angle >= 271 && player.angle <= 360) || (player.angle >= 0 && player.angle <= 89)
            player.y -= player_go_up_y
        end
    end
    if Input.key_down?(K_DOWN)
        if (player.angle >= 1 && player.angle <= 90) || (player.angle >= 91 && player.angle <= 179)
            player.x -= player_go_up_x
        end
        if (player.angle >= 91 && player.angle <= 180) || (player.angle >= 181 && player.angle <= 269)
            player.y -= player_go_up_y
        end
        if (player.angle >= 181 && player.angle <= 270) || (player.angle >= 271 && player.angle <= 359)
            player.x += player_go_up_x
        end
        if (player.angle >= 271 && player.angle <= 360) || (player.angle >= 0 && player.angle <= 89)
            player.y += player_go_up_y
        end
    end

    if Input.key_push?(K_SPACE)
        attack = Sprite.new(player.x + 25, player.y + 25, Image.new(20, 20, C_GREEN))
        player_attack.push(attack)
    end
    Sprite.draw(player_attack)
    if !player_attack.empty?
        player_attack.each do |obj|
            if (player.angle >= 1 && player.angle <= 90) || (player.angle >= 91 && player.angle <= 179)
                player_attack_true1 = true
                player_attack_true3 = false
            end
            if (player.angle >= 91 && player.angle <= 180) || (player.angle >= 181 && player.angle <= 269)
                player_attack_true2 = true
                player_attack_true4 = false
            end
            if (player.angle >= 181 && player.angle <= 270) || (player.angle >= 271 && player.angle <= 359)
                player_attack_true3 = true
                player_attack_true1 = false
            end
            if (player.angle >= 271 && player.angle <= 360) || (player.angle >= 0 && player.angle <= 89)
                player_attack_true4 = true
                player_attack_true2 = false
            end
            if obj.x >= 1940 || obj.x <= -20 || obj.y >= 1220 || obj.y <= -20
                obj.vanish
            end
            if player_attack_true1
                obj.x += attack_go_up_x
            end
            if player_attack_true2
                obj.y += attack_go_up_y
            end
            if player_attack_true3
                obj.x -= attack_go_up_x
            end
            if player_attack_true4
                obj.y -= attack_go_up_y
            end

        end
        Sprite.clean(player_attack)
    end
    #プレイヤー１ここまで

    #プレイヤー２
    if Input.key_down?(K_D)
        player2.angle += 1
        player2.angle = player2.angle % 360
        if (player2.angle >= 1 && player2.angle <= 90)
            player2_go_up_x += spead
            player2_go_up_y -= spead
        end
        if (player2.angle >= 91 && player2.angle <= 180)
            player2_go_up_x -= spead
            player2_go_up_y += spead
        end
        if (player2.angle >= 181 && player2.angle <= 270)
            player2_go_up_x += spead
            player2_go_up_y -= spead
        end
        if (player2.angle >= 271 && player2.angle <= 360)
            player2_go_up_x -= spead
            player2_go_up_y += spead
        end
    end
    if Input.key_down?(K_A)
        player2.angle -= 1
        player2.angle = player2.angle % 360
        if (player2.angle >= 1 && player2.angle <= 90)
            player2_go_up_x -= spead
            player2_go_up_y += spead
        end
        if (player2.angle >= 91 && player2.angle <= 180)
            player2_go_up_x += spead
            player2_go_up_y -= spead
        end
        if (player2.angle >= 181 && player2.angle <= 270)
            player2_go_up_x -= spead
            player2_go_up_y += spead
        end
        if (player2.angle >= 271 && player2.angle <= 360)
            player2_go_up_x += spead
            player2_go_up_y -= spead
        end
    end
    if Input.key_down?(K_W)
        if (player2.angle >= 1 && player2.angle <= 90) || (player2.angle >= 91 && player2.angle <= 179)
            player2.x += player2_go_up_x
        end
        if (player2.angle >= 91 && player2.angle <= 180) || (player2.angle >= 181 && player2.angle <= 269)
            player2.y += player2_go_up_y
        end
        if (player2.angle >= 181 && player2.angle <= 270) || (player2.angle >= 271 && player2.angle <= 359)
            player2.x -= player2_go_up_x
        end
        if (player2.angle >= 271 && player2.angle <= 360) || (player2.angle >= 0 && player2.angle <= 89)
            player2.y -= player2_go_up_y
        end
    end
    if Input.key_down?(K_S)
        if (player2.angle >= 1 && player2.angle <= 90) || (player2.angle >= 91 && player2.angle <= 179)
            player2.x -= player2_go_up_x
        end
        if (player2.angle >= 91 && player2.angle <= 180) || (player2.angle >= 181 && player2.angle <= 269)
            player2.y -= player2_go_up_y
        end
        if (player2.angle >= 181 && player2.angle <= 270) || (player2.angle >= 271 && player2.angle <= 359)
            player2.x += player2_go_up_x
        end
        if (player2.angle >= 271 && player2.angle <= 360) || (player2.angle >= 0 && player2.angle <= 89)
            player2.y += player2_go_up_y
        end
    end
    #プレイヤー２ここまで

    #プレイヤー３
    if Input.key_down?(K_6)
        player3.angle += 1
        player3.angle = player3.angle % 360
        if (player3.angle >= 1 && player3.angle <= 90)
            player3_go_up_x += spead
            player3_go_up_y -= spead
        end
        if (player3.angle >= 91 && player3.angle <= 180)
            player3_go_up_x -= spead
            player3_go_up_y += spead
        end
        if (player3.angle >= 181 && player3.angle <= 270)
            player3_go_up_x += spead
            player3_go_up_y -= spead
        end
        if (player3.angle >= 271 && player3.angle <= 360)
            player3_go_up_x -= spead
            player3_go_up_y += spead
        end
    end
    if Input.key_down?(K_4)
        player3.angle -= 1
        player3.angle = player3.angle % 360
        if (player3.angle >= 1 && player3.angle <= 90)
            player3_go_up_x -= spead
            player3_go_up_y += spead
        end
        if (player3.angle >= 91 && player3.angle <= 180)
            player3_go_up_x += spead
            player3_go_up_y -= spead
        end
        if (player3.angle >= 181 && player3.angle <= 270)
            player3_go_up_x -= spead
            player3_go_up_y += spead
        end
        if (player3.angle >= 271 && player3.angle <= 360)
            player3_go_up_x += spead
            player3_go_up_y -= spead
        end
    end
    if Input.key_down?(K_8)
        if (player3.angle >= 1 && player3.angle <= 90) || (player3.angle >= 91 && player3.angle <= 179)
            player3.x += player3_go_up_x
        end
        if (player3.angle >= 91 && player3.angle <= 180) || (player3.angle >= 181 && player3.angle <= 269)
            player3.y += player3_go_up_y
        end
        if (player3.angle >= 181 && player3.angle <= 270) || (player3.angle >= 271 && player3.angle <= 359)
            player3.x -= player3_go_up_x
        end
        if (player3.angle >= 271 && player3.angle <= 360) || (player3.angle >= 0 && player3.angle <= 89)
            player3.y -= player3_go_up_y
        end
    end
    if Input.key_down?(K_5)
        if (player3.angle >= 1 && player3.angle <= 90) || (player3.angle >= 91 && player3.angle <= 179)
            player3.x -= player3_go_up_x
        end
        if (player3.angle >= 91 && player3.angle <= 180) || (player3.angle >= 181 && player3.angle <= 269)
            player3.y -= player3_go_up_y
        end
        if (player3.angle >= 181 && player3.angle <= 270) || (player3.angle >= 271 && player3.angle <= 359)
            player3.x += player3_go_up_x
        end
        if (player3.angle >= 271 && player3.angle <= 360) || (player3.angle >= 0 && player3.angle <= 89)
            player3.y += player3_go_up_y
        end
    end
    #プレイヤー３ここまで

    #壁判定
    if player.x <= 20
        player.x = 20
    end
    if player.x >= 1800
        player.x = 1800
    end
    if player.y <= 20
        player.y = 20
    end
    if player.y >= 1080
        player.y = 1080
    end

    if player3.x <= 20
        player3.x = 20
    end
    if player3.x >= 1800
        player3.x = 1800
    end
    if player3.y <= 20
        player3.y = 20
    end
    if player3.y >= 1080
        player3.y = 1080
    end

    if player2.x <= 20
        player2.x = 20
    end
    if player2.x >= 1800
        player2.x = 1800
    end
    if player2.y <= 20
        player2.y = 20
    end
    if player2.y >= 1080
        player2.y = 1080
    end

    # if player === blocks
    #     player.x -= 10
    #     player.y -= 10
    # end

    break if Input.key_push?(K_ESCAPE)
end