extends Area2D

signal hit

var SPEED = 400
var velocity = Vector2()
var screensize

func _ready():
	hide()
	screensize = get_viewport_rect().size
	
func _unflip():
	$Sprite.rotation_degrees = 0

func move_right():
	velocity = Vector2()
	velocity.x +=1
func move_left():
	velocity = Vector2()
	velocity.x -=1
func move_up():
	velocity = Vector2()
	velocity.y -=1
func move_down():
	velocity = Vector2()
	velocity.y +=1

func _process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x +=1
	if Input.is_action_pressed("ui_left"):
		velocity.x -=1
	if Input.is_action_pressed("ui_down"):
		velocity.y +=1
	if Input.is_action_pressed("ui_up"):
		velocity.y -=1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)

	if velocity.x != 0:
		$Sprite.flip_h = velocity.x < 0
		$Sprite.rotation_degrees = 0
	if velocity.y != 0:
		$Sprite.flip_h = false
		if velocity.y > 0:
			$Sprite.rotation_degrees = 90
		if velocity.y < 0:
			$Sprite.rotation_degrees = 270

func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	call_deferred("set_monitoring", false)
	
func start(pos):
	position = pos
	show()
	monitoring = true
