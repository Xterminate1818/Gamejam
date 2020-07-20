extends Projectile

func _ready():
	damage = 3

func on_impact(collision):
	for body in $Area2D.get_overlapping_bodies():
		if body.get("health") != null and body.get_type() != "player":
			body.health -= damage
	$Particles2D.emitting = true
	$KillTimer.start()
	set_physics_process(false)
	$CollisionShape2D.disabled = true
	$Sprite.visible = false

func _on_KillTimer_timeout():
	queue_free()
