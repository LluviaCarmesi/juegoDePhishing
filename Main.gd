extends Node

export (PackedScene) var Mob
export (PackedScene) var Bubble
export (PackedScene) var GoodMail
export (PackedScene) var BigMob

var score
var play = true
var death = false
var musicAdvance = 0

var MIN_SPEED = 175
var MAX_SPEED = 225
func _ready():
	randomize()

func music_mute():
	musicAdvance = $Pause2/GamePlay.get_playback_position()
	$Pause2/GamePlay.stop()
	$Pause2/Cruz.show()
	play = false
	$Pause2.music_disallow(musicAdvance)

func music_play():
	$Pause2/GamePlay.play()
	$Pause2/GamePlay.seek(musicAdvance)
	$Pause2/Cruz.hide()
	play = true
	$Pause2.music_allow()

func _input(event):
	if(event.is_action_pressed("mute") && death == false):
		if (play == true):
			music_mute()
		else:
			music_play()

func new_game():
	score = 0
	MIN_SPEED = 175
	MAX_SPEED = 225
	$Player.SPEED = 400
	$MobTimer.wait_time = 0.7
	$Player.start($Position2D.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$Player._unflip()
	$Pause2.pause_allow()
	$MoveDown.show()
	$MoveUp.show()
	$MoveRight.show()
	$MoveLeft.show()
	$Pause2/Pause.show()

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.game_over(score)
	musicAdvance = $Pause2/GamePlay.get_playback_position()
	$Pause2/GamePlay.stop()
	$GoodMailTimer.stop()
	$BigMobTimer.stop()
	$Pause2.pause_disallow()
	$DeathTimer.start()
	$MoveDown.hide()
	$MoveUp.hide()
	$MoveRight.hide()
	$MoveLeft.hide()
	$Pause2/Mute.hide()
	$Pause2/Pause.hide()
	death = true
	if(play == true):
		$Death.play()
		yield($DeathTimer, "timeout")
		$Death.stop()
		$Pause2/GamePlay.play()
		death = false
		$Pause2/Mute.show()
	else:
		yield($DeathTimer, "timeout")
		musicAdvance = 0
		death = false
		$Pause2/Mute.show()
	
func _on_StartTimer_timeout():
	$MobTimer.start()
	$BubbleTimer.start()
	$ScoreTimer.start()
	$BubbleTimer2.start()
	$GoodMailTimer.start()
	$BigMobTimer.start()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)
	$BubbleTimer.wait_time = randi()%5 + 2
	MIN_SPEED *= 1.1
	MAX_SPEED *= 1.25
	
	if(score == 2):
		$Player.SPEED = 550
		$MobTimer.wait_time = 0.5
		$BigMobTimer.wait_time = 4.5
	if(score == 4):
		$Player.SPEED = 700
		$MobTimer.wait_time = 0.4
		$BigMobTimer.wait_time = 3.0
	if(score == 6):
		$Player.SPEED = 900
		$MobTimer.wait_time = 0.3
		$BigMobTimer.wait_time = 2.0
	if(score == 8):
		$Player.SPEED = 1050
		$MobTimer.wait_time = 0.2
		$BigMobTimer.wait_time = 1.5
	if(score == 10):
		$Player.SPEED = 1100
		$MobTimer.wait_time = 0.1
		$BigMobTimer.wait_time = 1.0

func _on_MobTimer_timeout():
	$MobPath/MobSpawn.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	var direction = $MobPath/MobSpawn.rotation + PI/2
	mob.position = $MobPath/MobSpawn.position
	direction += rand_range(-PI/4, PI/4)
	mob.rotation = direction
	mob.set_linear_velocity(Vector2(rand_range(MIN_SPEED, MAX_SPEED) ,0).rotated(direction))

func _on_BubbleTimer_timeout():
	$BubblePath/BubbleSpawn.set_offset(randi())
	var bubble = Bubble.instance()
	add_child(bubble)
	var direction = $BubblePath/BubbleSpawn.rotation + PI/2
	bubble.position = $BubblePath/BubbleSpawn.position
	direction += rand_range(-PI/4, PI/4)
	bubble.rotation = direction
	bubble.set_linear_velocity(Vector2(rand_range(125, 175) ,0).rotated(direction))
	
func _on_BubbleTimer2_timeout():
	$BubblePath/BubbleSpawn.set_offset(randi())
	var bubble2 = Bubble.instance()
	add_child(bubble2)
	var direction2 = $BubblePath/BubbleSpawn.rotation + PI/2
	bubble2.position = $BubblePath/BubbleSpawn.position
	direction2 += rand_range(-PI/4, PI/4)
	bubble2.rotation = direction2
	bubble2.set_linear_velocity(Vector2(rand_range(125, 175) ,0).rotated(direction2))

func _on_GoodMailTimer_timeout():
	$GoodMailPath/GoodMailSpawn.set_offset(randi())
	var goodMail = GoodMail.instance()
	add_child(goodMail)
	var direction = $GoodMailPath/GoodMailSpawn.rotation + PI/2
	goodMail.position = $GoodMailPath/GoodMailSpawn.position
	direction += rand_range(-PI/4, PI/4)
	goodMail.rotation = direction
	goodMail.set_linear_velocity(Vector2(rand_range(MIN_SPEED, MAX_SPEED) ,0).rotated(direction))

func _on_BigMobTimer_timeout():
	$BigMobPath/BigMobSpawn.set_offset(randi())
	var bigMob = BigMob.instance()
	add_child(bigMob)
	var direction = $BigMobPath/BigMobSpawn.rotation + PI/2
	bigMob.position = $BigMobPath/BigMobSpawn.position
	direction += rand_range(-PI/4, PI/4)
	bigMob.rotation = direction
	bigMob.set_linear_velocity(Vector2(rand_range(MIN_SPEED, MAX_SPEED) ,0).rotated(direction))
