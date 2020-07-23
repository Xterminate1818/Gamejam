extends Projectile


var ignore = []

func _ready():
	$FireSound.play(0.0)
	energy_cost = 3
	damage = 1

func _on_body_entered(body):
	if body.get("health") != null:
		body.play_hit()
		body.health -= damage * damage_mod


