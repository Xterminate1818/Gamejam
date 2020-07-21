extends Wand

func _ready():
	$ProjectileSpawn.add_child(Globals.ecobeam_ps.instance())
	$ProjectileSpawn/EcoBeam.deactivate()
	$ProjectileSpawn.add_child(Globals.phantombeam_ps.instance())
	$ProjectileSpawn/PhantomBeam.deactivate()
	$ProjectileSpawn.add_child(Globals.wavebeam_ps.instance())
	$ProjectileSpawn/WaveBeam.deactivate()
	$ProjectileSpawn.add_child(Globals.explosivebeam_ps.instance())
	$ProjectileSpawn/ExplosiveBeam.deactivate()

func get_beam_type(p):
	if p == Globals.Magic[Globals.Projectile1]:
		return $ProjectileSpawn/EcoBeam
	elif p == Globals.Magic[Globals.Projectile2]:
		return $ProjectileSpawn/PhantomBeam
	elif p == Globals.Magic[Globals.Projectile3]:
		return $ProjectileSpawn/WaveBeam
	elif p == Globals.Magic[Globals.Projectile4]:
		return $ProjectileSpawn/ExplosiveBeam
	else:
		return null

func fire(projectile):
	var beam = get_beam_type(projectile)
	if beam != null:
		beam.activate()
	if $ShootDelay.is_stopped():
		$ShootDelay.start()
		var c = beam.get_collider()
		if typeof(c) == TYPE_ARRAY:
			for body in c:
				if body != null and body.has_method("get_type") && body.get_type() == "enemy":
					body.health -= beam.damage
					body.play_hit()
		else:
			if c != null and c.has_method("get_type") && c.get_type() == "enemy":
				c.health -= beam.damage
				c.play_hit()
			return 0

func _input(event):
	if event.is_action_released("shoot"):
		for c in $ProjectileSpawn.get_children():
			c.deactivate()
