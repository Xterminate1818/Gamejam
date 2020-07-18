extends RigidBody2D

var speed = 45
var gravity = 500
const UP = Vector2(0, -1)
var is_grounded
var touching_wall = 0 

var velocity = Vector2()

func apply_gravity(delta, modifier = 1):
	velocity.y += gravity * delta * modifier

func _physics_process(_delta):
	if Globals.player != null:
		velocity.x = position.direction_to(Globals.player).normalized().x
		apply_gravity(_delta)
	velocity = move_and_slide(velocity * speed)
	
	if is_on_wall():
		if velocity.x > -1 and velocity.x < 1:
			velocity.x = 0
	var was_on_floor = is_on_floor()
	velocity = move_and_slide(velocity, Vector2.UP)
	if !was_on_floor and is_on_floor():
		emit_signal("grounded_updated", is_on_floor())
	var was_grounded = is_grounded
	is_grounded = is_on_floor()
	
	if Vector2.ZERO == velocity:
		velocity.y = -10
		
