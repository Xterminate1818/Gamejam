extends Enemy

var Hell_Projectile = preload("res://ai/Scenes/DemonFireball.tscn")

onready var ShootDelay : Timer = $ShootDelay
onready var ProjectileSpawn: Node2D = $Position2D
onready var PlayerRaycast: RayCast2D = $PlayerRaycast

func _ready():
	health = 2
	knockback_amount = 700

func _physics_process(_delta):
	if knockback != Vector2.ZERO:
		knockback = lerp(knockback, Vector2.ZERO, 0.5)
		move_and_slide(-knockback * knockback_amount)
		if knockback.x < 1 and -1 < knockback.x and knockback.y < 1 and -1 < knockback.y:
			knockback = Vector2.ZERO
		return
	var player_position = get_player_position()
	var dist = global_position.distance_to(player_position)
	
	PlayerRaycast.cast_to = player_position - global_position
	var collider = PlayerRaycast.get_collider()
	

	if dist <= 250:
		velocity.x = position.direction_to(player_position).normalized().x * speed
		if collider != null && collider.has_method("get_type") && collider.get_type() == "player":
			shoot_fireball(position.direction_to(player_position))
	else:
		velocity = Vector2(0, 0)

	apply_gravity(_delta)
	velocity = move_and_slide(velocity, UP)
	if velocity.x > 0:
		$Hell.flip_h = false
	elif velocity.x < 0:
		$Hell.flip_h = true
	if health <= 0:
		queue_free()
		
	if is_on_wall() and is_on_floor():
		velocity.y = -90
		
func do_knockback(normal):
	if $Hell.flip_h == true:
		knockback = Vector2(-4, -4)
	else:
		knockback = Vector2(4, 0)

func shoot_fireball(direction):
	if ShootDelay.is_stopped():
		var temp = Hell_Projectile.instance()
		get_tree().current_scene.add_child(temp)
		temp.global_position = ProjectileSpawn.global_position
		temp.launch_vector(direction)
		ShootDelay.start()
