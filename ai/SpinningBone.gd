extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 100

func _physics_process(delta):
	var c = move_and_collide(velocity)
	if c != null:
		on_impact(c)

func launch_right():
	velocity = (Vector2.RIGHT * speed)
func launch_left():
	velocity = (Vector2.LEFT * speed)
func launch_upleft():
	velocity = (Vector2(-1, -1).normalized() * speed)
func launch_upright():
	velocity = (Vector2(1, -1).normalized() * speed)	

func on_impact(collision):
	print(collision.collider)
	if collision.collider.has_method("get_type"):
		collision.collider.health -= 1
	queue_free()
