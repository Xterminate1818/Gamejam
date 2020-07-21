extends Beam

func _ready():
	energy_cost = 2
	damage = 1

func get_collider():
	$FireSound.play(0.0)
	var c = $RayCast2D.get_collider()
	if c != null and c.has_method("get_type") and c.get_type() == "enemy":
		print("knock")
		c.do_knockback($RayCast2D.get_collision_normal())
	return $RayCast2D.get_collider()
