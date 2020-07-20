extends Enemy

var Spinning_Bone = preload("res://ai/SpinningBone.tscn")

onready var ShootDelay : Timer = $ShootDelay
onready var ProjectileSpawn: Node2D = $Position2D

func apply_gravity(delta, modifier = 1):
	velocity.y += gravity * delta * modifier

func _physics_process(_delta):
	var dist = global_position.distance_to(Globals.player)
	if $RayCast2D.get_collider() != null && $RayCast2D.get_collider().has_method("get_type") and $RayCast2D.get_collider().get_type() == "player":
		velocity = Vector2(0, 0)
		throw_bone(Vector2.LEFT)
	elif $RayCast2D2.get_collider() != null && $RayCast2D2.get_collider().has_method("get_type") and $RayCast2D2.get_collider().get_type() == "player":
		velocity = Vector2(0, 0)
		throw_bone(Vector2.RIGHT)
	elif $RayCast2D3.get_collider() != null && $RayCast2D3.get_collider().has_method("get_type") and $RayCast2D3.get_collider().get_type() == "player":
		velocity = Vector2(0, 0)
		throw_bone(Vector2.UP + Vector2.LEFT)
	elif $RayCast2D4.get_collider() != null && $RayCast2D4.get_collider().has_method("get_type") and $RayCast2D4.get_collider().get_type() == "player":
		velocity = Vector2(0, 0)
		throw_bone(Vector2.UP + Vector2.RIGHT)
	else:
		apply_gravity(_delta)
		velocity.x *= speed
		velocity = move_and_slide(velocity, UP)

	if dist <= 400:
		velocity.x = position.direction_to(Globals.player).normalized().x
	else:
			velocity = Vector2(0, 0)

	if velocity.x > 0:
		$Skeleton.flip_h = false
	elif velocity.x < 0:
		$Skeleton.flip_h = true
	
	# Kill
	if health <= 0:
		queue_free()
	
	# Jump
	if is_on_wall() and is_on_floor():
		velocity.y = -150

func throw_bone(direction):
	if ShootDelay.is_stopped():
		var temp = Spinning_Bone.instance()
		get_tree().current_scene.add_child(temp)
		temp.global_position = ProjectileSpawn.global_position
		temp.launch_vector(direction)
		ShootDelay.start()

