extends Sprite
class_name Wand

func fire(projectile, effect):
	if $ShootDelay.is_stopped() and projectile != null:
		var temp = projectile.instance()
		get_tree().current_scene.add_child(temp)
		temp.global_transform = $ProjectileSpawn.global_transform
		var energy_cost = temp.launch(null, null)
		$ShootDelay.start()
		return energy_cost
