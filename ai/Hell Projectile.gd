extends Projectile

func launch_right():
	velocity = (Vector2.RIGHT * speed)
func launch_left():
	velocity = (Vector2.LEFT * speed)
func launch_upleft():
	velocity = (Vector2(1, -1).normalized() * speed)
func launch_upright():
	velocity = (Vector2(-1, -1).normalized() * speed)	
func on_impact(collision):
	if collision.collider.has_method("get_type"):
		collision.collider.set_health(collision.collider.get_health() - 1)
	queue_free()
