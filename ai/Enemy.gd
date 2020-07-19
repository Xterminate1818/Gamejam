extends KinematicBody2D

class_name Enemy

var speed = 60
var gravity =500
var health = 5
const UP = Vector2(0, -1)

var velocity = Vector2()

func apply_gravity(delta, modifier = 1):
	velocity.y += gravity * delta * modifier

func _physics_process(_delta):
	if Globals.player != null:
		if $RayCast2D.get_collider() != null && $RayCast2D.get_collider().has_method("get_type") and $RayCast2D.get_collider().get_type() == "player":
			velocity = Vector2(0, 0)
		elif $RayCast2D2.get_collider() != null && $RayCast2D2.get_collider().has_method("get_type") and $RayCast2D2.get_collider().get_type() == "player":
			velocity = Vector2(0, 0)
		elif $RayCast2D3.get_collider() != null && $RayCast2D3.get_collider().has_method("get_type") and $RayCast2D3.get_collider().get_type() == "player":
			velocity = Vector2(0, 0)
		elif $RayCast2D4.get_collider() != null && $RayCast2D4.get_collider().has_method("get_type") and $RayCast2D4.get_collider().get_type() == "player":
			velocity = Vector2(0, 0)
		else:
			velocity.x = position.direction_to(Globals.player).normalized().x
	apply_gravity(_delta)
	velocity.x *= speed
	velocity = move_and_slide(velocity, UP)
	if velocity.x > 0:
	#	$(Enemy Sprite).flip_h = false
	elif velocity.x < 0:
	#	$(Enemy Sprite).flip_h = true
	
	if is_on_wall() and is_on_floor():
		velocity.y = -150
