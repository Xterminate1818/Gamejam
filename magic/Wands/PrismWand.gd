extends Wand

func _ready():
	$ProjectileSpawn.add_child(Globals.ecobeam_ps.instance())
	$ProjectileSpawn/EcoBeam.deactivate()

func get_beam_type(p):
	if p == Globals.Magic[Globals.Projectile1]:
		return $ProjectileSpawn/EcoBeam
	elif p == Globals.Magic[Globals.Projectile2]:
		return null
	elif p == Globals.Magic[Globals.Projectile3]:
		return null
	elif p == Globals.Magic[Globals.Projectile4]:
		return null
	else:
		return null

func fire(projectile):
	var beam = get_beam_type(projectile)
	if beam != null:
		beam.activate()
	if $ShootDelay.is_stopped():
		$ShootDelay.start()
		var c = beam.get_collider()
		print(c)
		if c != null and c.has_method("get_type") && c.get_type() == "enemy":
			c.health -= beam.damage
		return beam.energy_cost

func _input(event):
	if event.is_action_released("shoot"):
		for c in $ProjectileSpawn.get_children():
			c.deactivate()
