extends KinematicBody2D

var speed = 75
var gravity = 500
const UP = Vector2(0, -1)

var velocity = Vector2()

func apply_gravity(delta, modifier = 1):
	velocity.y += gravity * delta * modifier

func _physics_process(_delta):
	if Globals.player != null:
		velocity.x = position.direction_to(Globals.player).normalized().x
		apply_gravity(_delta)
	velocity = move_and_slide(velocity * speed)
	
	if is_on_wall():
		velocity.y = -50
		velocity = move_and_slide(velocity, UP)
