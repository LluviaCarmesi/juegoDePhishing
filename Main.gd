extends Node

export (PackedScene) var Mob
var score

var MIN_SPEED = 175
var MAX_SPEED = 225

func _ready():
	randomize()
	
func new_game():
	score = 0
	MIN_SPEED = 175
	MAX_SPEED = 225
	$Player.SPEED = 400
	$MobTimer.wait_time = 0.7
	$Player.start($Position2D.position)
	$StartTimer.start()
	$HUD.show_ready("Get Ready")
	$HUD.update_score(score)
	
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.game_over(score)

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)
	MIN_SPEED *= 1.5
	MAX_SPEED *= 1.5
	if(score == 2):
		$Player.SPEED = 550
		$MobTimer.wait_time = 0.5
	if(score == 4):
		$Player.SPEED = 700
		$MobTimer.wait_time = 0.4
	if(score == 6):
		$Player.SPEED = 900
		$MobTimer.wait_time = 0.3
	if(score == 8):
		$Player.SPEED = 1050
		$MobTimer.wait_time = 0.2
	if(score == 15):
		game_over()

func _on_MobTimer_timeout():
	$MobPath/MobSpawn.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	var direction = $MobPath/MobSpawn.rotation + PI/4
	mob.position = $MobPath/MobSpawn.position
	direction += rand_range(-PI/4, PI/4)
	mob.rotation = direction
	mob.set_linear_velocity(Vector2(rand_range(MIN_SPEED, MAX_SPEED) ,0).rotated(direction))