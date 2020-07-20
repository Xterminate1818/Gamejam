extends EnemyProjectile

func launch_right():
	launch_vector(Vector2.RIGHT)
func launch_left():
	launch_vector(Vector2.LEFT)
func launch_upleft():
	launch_vector(Vector2(-1, -1))
func launch_upright():
	velocity = (Vector2(1, -1))
