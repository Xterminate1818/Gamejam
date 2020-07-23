extends Wand

var charge_level = 0
var max_charge = 3
var projectile = null

onready var ChargeTimer: Timer = $ChargeTimer

func fire(p):
	print(p)
	projectile = p
	if ChargeTimer.is_stopped():
		ChargeTimer.start()
		if charge_level == 0:
			var temp = p.instance()
			get_tree().current_scene.add_child(temp)
			var energy = temp.energy_cost
			temp.queue_free()
			return energy * 2

func _process(delta):
	scale = Vector2(charge_level / 2.0 + 1.0, charge_level / 2.0 + 1.0)

func _on_ChargeTimer_timeout():
	charge_level = clamp(charge_level + 1, 0, max_charge)

func _input(event):
	if event.is_action_released("shoot"):
		ChargeTimer.stop()
		if charge_level <= 0:
			charge_level = 0
			return
		print(charge_level)
		var temp = projectile.instance()
		get_tree().current_scene.add_child(temp)
		temp.global_transform = $ProjectileSpawn.global_transform
		var energy_cost = temp.launch(wand_type, charge_level)
		charge_level = 0
