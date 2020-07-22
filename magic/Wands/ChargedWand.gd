extends Wand

var charge_level = 0
var max_charge = 3
var projectile = null

onready var ChargeTimer: Timer = $ChargeTimer

func fire(p):
	projectile = p
	if ChargeTimer.is_stopped():
		ChargeTimer.start()

func _process(delta):
	print(charge_level)
	scale = Vector2(charge_level / 2 + 1, charge_level / 2 + 1)

func _on_ChargeTimer_timeout():
	charge_level = clamp(charge_level + 0.5, 0, max_charge)

func _input(event):
	if event.is_action_released("shoot"):
		ChargeTimer.stop()
		if charge_level <= 0:
			charge_level = 0
			return
		var temp = projectile.instance()
		get_tree().current_scene.add_child(temp)
		temp.global_transform = $ProjectileSpawn.global_transform
		var energy_cost = temp.launch(wand_type, charge_level)
		charge_level = 0
