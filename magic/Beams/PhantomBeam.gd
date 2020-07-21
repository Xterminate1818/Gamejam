extends Beam

func _ready():
	energy_cost = 3
	damage = 1

func activate():
	$Beam.visible = true
	$RayCast2D.enabled = true
	$Area2D.monitoring = true

func deactivate():
	$Beam.visible = false
	$RayCast2D.enabled = false
	$Area2D.monitoring = false

func get_collider():
	$FireSound.play(0.0)
	var r = []
	for b in $Area2D.get_overlapping_bodies():
		r.append(b)
	return r

func _physics_process(delta):
	$RayCast2D.cast_to = max_cast
	if $RayCast2D.is_colliding():
		$End.global_position = $RayCast2D.get_collision_point()
	else:
		$End.position = max_cast
	$Beam.region_rect.end.x = $End.position.length()
	$Area2D/CollisionShape2D.shape.extents.x = $End.position.length() / 2
	$Area2D.position.x = $End.position.length() / 2
