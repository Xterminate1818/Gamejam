extends Projectile

func _ready():
	damage = 3
	energy_cost = 5

func on_impact(collision):
	if collision.collider.has_method("get_type") && collision.collider.get_type() == "enemy":
		var c = collision.collider
		c.health -= damage * damage_mod
		explode()
	elif bounces_left != 0:
		bounces_left -= 1
		look_at(position + velocity.bounce(collision.normal))
		launch(null)
	else:
		explode()

func explode():
	for body in $Area2D.get_overlapping_bodies():
		if body.get("health") != null and body.get_type() != "player":
			body.health -= damage
			if body.has_method("play_hit"):
				body.play_hit()
	$Explosion.play(0.0)
	$Particles2D.emitting = true
	$KillTimer.start()
	set_physics_process(false)
	$CollisionShape2D.disabled = true
	$Sprite.visible = false

func _on_KillTimer_timeout():
	queue_free()
