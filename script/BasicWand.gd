extends Sprite

onready var ShootDelay : Timer = $ShootDelay
onready var ProjectileSpawn : Timer = $ProjectileSpawn

export var projectile_ps = globals.WHITE_PROJECTILE_PS

func fire_projectile(rot):
	if ShootDelay.is_stopped():
		var temp = projectile_ps.instance()
		get_tree().current_scene.add_child(temp)
		temp.global_position = ProjectileSpawn.global_position
		temp.rotation_degrees = rot
		temp.launch()
		ShootDelay.start()