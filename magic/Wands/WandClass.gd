extends Sprite
class_name Wand
var wand_type
var effect_type

func fire(projectile, effect):
	if $ShootDelay.is_stopped() and projectile != null:
		var temp = projectile.instance()
		get_tree().current_scene.add_child(temp)
		temp.global_transform = $ProjectileSpawn.global_transform
		var energy_cost = temp.launch(wand_type, effect_type)
		$ShootDelay.start()
		return energy_cost
