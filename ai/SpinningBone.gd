extends EnemyProjectile

func launch_right():
	launch_vector(Vector2.RIGHT)
func launch_left():
	launch_vector(Vector2.LEFT)
func launch_upleft():
	launch_vector(Vector2.LEFT + Vector2.UP)
func launch_upright():
	launch_vector(Vector2.RIGHT + Vector2.UP)
