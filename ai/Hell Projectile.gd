extends EnemyProjectile

func on_impact(collision):
	var c = collision.collider
	if c.has_method("get_type") and c.get_type() == "player":
		Player.health -= 1
	queue_free()
