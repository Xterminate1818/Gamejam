extends Sprite
class_name Wands

func fire(projectile, effect):
	if $ShootDelay.is_stopped() and projectile != null:
		print("fire")
		var temp = projectile.instance()
		get_tree().current_scene.add_child(temp)
		temp.global_transform = $ProjectileSpawn.global_transform
		temp.launch(null, null)
		$ShootDelay.start()
