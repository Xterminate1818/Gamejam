extends Node2D
class_name Beam

var damage = 1
var energy_cost = 1

var max_cast = Vector2(400, 0)

func get_collider():
	$FireSound.play(0.0)
	return $RayCast2D.get_collider()

func activate():
	$Beam.visible = true
	$RayCast2D.enabled = true

func deactivate():
	$Beam.visible = false
	$RayCast2D.enabled = false

func _physics_process(delta):
	$RayCast2D.cast_to = max_cast
	if $RayCast2D.is_colliding():
		$End.global_position = $RayCast2D.get_collision_point()
	else:
		$End.position = max_cast
	$Beam.region_rect.end.x = $End.position.length()
