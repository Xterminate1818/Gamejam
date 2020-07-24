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
	scale = Vector2(charge_level / 2.0 + 1.0, charge_level / 2.0 + 1.0)
	$Light2D.energy = charge_level
	if $Light2D.energy != 0:
		$Light2D.energy /= 2

func _on_ChargeTimer_timeout():
	charge_level = clamp(charge_level + 1, 1, max_charge)

func _input(event):
	if event.is_action_released("shoot"):
		ChargeTimer.stop()
		if charge_level <= 0 or projectile == null:
			return
		var temp = projectile.instance()
		get_tree().current_scene.add_child(temp)
		temp.global_transform = $ProjectileSpawn.global_transform
		var energy_cost = temp.launch(wand_type, charge_level)
		Player.energy -= energy_cost * 2
		charge_level = 0
