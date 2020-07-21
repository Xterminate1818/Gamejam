extends Projectile

func _ready():
	$FireSound.play(0.0)
	energy_cost = 2
	damage = 1


func on_impact(collision):
	if collision.collider.has_method("get_type") && collision.collider.get_type() == "enemy":
		var c = collision.collider
		c.health -= damage * damage_mod
		c.do_knockback(collision.normal)
		c.play_hit()
		if $FireSound.playing:
			set_physics_process(false)
			$CollisionShape2D.disabled = true
			$Sprite.visible = false
			yield($FireSound, "finished")
		queue_free()
	elif bounces_left != 0:
		bounces_left -= 1
		look_at(position + velocity.bounce(collision.normal))
		launch(null)
	else:
		if $FireSound.playing:
			set_physics_process(false)
			$CollisionShape2D.disabled = true
			$Sprite.visible = false
			yield($FireSound, "finished")
		queue_free()
