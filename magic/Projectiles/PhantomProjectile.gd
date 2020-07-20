extends Projectile


var ignore = []

func _ready():
	energy_cost = 3
	damage = 1

func _on_body_entered(body):
	if body.get("health") != null:
		body.health -= damage * damage_mod
	
