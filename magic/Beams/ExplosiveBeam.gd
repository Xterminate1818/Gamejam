extends Beam

func _ready():
	damage = 3
	energy_cost = 5

func activate():
	$Beam.visible = true
	$RayCast2D.enabled = true
	$End/Area2D.monitoring = true

func deactivate():
	$Beam.visible = false
	$RayCast2D.enabled = false
	$End/Area2D.monitoring = false

func get_collider():
	$FireSound.play(0.0)
	$End/Particles2D.emitting = true
	var r = []
	for b in $End/Area2D.get_overlapping_bodies():
		r.append(b)
	return r
