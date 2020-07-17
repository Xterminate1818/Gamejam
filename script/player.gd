extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 32
const SPEED = 200
const JUMP_HEIGHT = -550
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT

	motion = move_and_slide(motion, UP)

	if position.y >= 493:
		get_tree().change_scene("Death Screen.tscn")
	pass


func _on_Area2D_body_entered(body):
	body.get_tree().change_scene("Logan is awful.tscn")
