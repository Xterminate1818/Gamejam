extends Enemy

export var max_range: int = 200
export var stationary: bool = false

var Spinning_Bone = preload("res://ai/Scenes/SpinningBone.tscn")

onready var ShootDelay : Timer = $ShootDelay
onready var ProjectileSpawn: Node2D = $Position2D

func _ready():
	health = 1.5
	$RayCast2D.cast_to.x = -1 * max_range
	$RayCast2D2.cast_to.y = 1 * max_ranged

func apply_gravity(delta, modifier = 1):
	velocity.y += gravity * delta * modifier

func _physics_process(_delta):
	var dist = global_position.distance_to(Player.position)
	var gravity = 4350
	if knockback != Vector2.ZERO:
		knockback = lerp(knockback, Vector2.ZERO, 0.5)
		move_and_slide(-knockback * knockback_amount)
		if knockback.x < 1 and -1 < knockback.x and knockback.y < 1 and -1 < knockback.y:
			knockback = Vector2.ZERO
		return
	if $RayCast2D.get_collider() != null && $RayCast2D.get_collider().has_method("get_type") and $RayCast2D.get_collider().get_type() == "player":
		velocity = Vector2(0, 0)
		throw_bone(Vector2.LEFT)
	elif $RayCast2D2.get_collider() != null && $RayCast2D2.get_collider().has_method("get_type") and $RayCast2D2.get_collider().get_type() == "player":
		velocity = Vector2(0, 0)
		throw_bone(Vector2.RIGHT)
	else:
		apply_gravity(_delta)
		velocity.x *= speed
		velocity = move_and_slide(velocity, UP)
		
	if dist <= max_range and not stationary:
		velocity.x = position.direction_to(Player.position).normalized().x
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
		velocity.y = -90

func throw_bone(direction):
	if ShootDelay.is_stopped():
		var temp = Spinning_Bone.instance()
		get_tree().current_scene.add_child(temp)
		temp.global_position = ProjectileSpawn.global_position
		temp.launch_vector(direction)
		ShootDelay.start()
		
func do_knockback(normal):
	if $Skeleton.flip_h == true:
		knockback = Vector2(-4, -4)
	else:
		knockback = Vector2(4, 0)

