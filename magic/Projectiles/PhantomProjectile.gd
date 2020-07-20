extends Projectile


var ignore = []

func _on_body_entered(body):
	if body.get("health") != null:
		body.health -= 1
	
