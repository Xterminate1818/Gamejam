extends Sprite

onready var ShootDelay : Timer = $ShootDelay
onready var ProjectileSpawn : Timer = $ProjectileSpawn
onready var Player = get_parent().get_parent()

export var projectile_ps = globals.WHITE_PROJECTILE_PS

func fire_projectile(rot):
	if ShootDelay.is_stopped() and Player.energy != 0:
		Player.Stats.interrupt_regen()
		Player.energy -= 1
		var temp = projectile_ps.instance()
		get_tree().current_scene.add_child(temp)
		temp.global_position = ProjectileSpawn.global_position
		temp.rotation_degrees = rot
		temp.launch()
		ShootDelay.start()