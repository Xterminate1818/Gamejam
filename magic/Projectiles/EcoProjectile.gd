extends Projectile


func _ready():
	$FireSound.play(0.0)
	energy_cost = 0
	damage = 0.5

