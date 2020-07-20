extends Wand

func _ready():
	wand_type = Globals.Conduit2

func fire(projectile, effect):
	if $ShootDelay.is_stopped() and projectile != null:
		var temp1 = projectile.instance()
		var temp2 = projectile.instance()
		var temp3 = projectile.instance()
		get_tree().current_scene.add_child(temp1)
		get_tree().current_scene.add_child(temp2)
		get_tree().current_scene.add_child(temp3)
		temp1.global_transform = $ProjectileSpawn1.global_transform
		temp2.global_transform = $ProjectileSpawn2.global_transform
		temp3.global_transform = $ProjectileSpawn3.global_transform
		var energy_cost = temp1.launch(wand_type, effect_type)
		energy_cost += temp2.launch(wand_type, effect_type)
		energy_cost += temp3.launch(wand_type, effect_type)
		$ShootDelay.start()
		return energy_cost
