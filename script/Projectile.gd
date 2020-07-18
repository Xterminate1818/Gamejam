extends KinematicBody2D
class_name Projectile

export var speed = 300
var velocity = Vector2.ZERO

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		on_impact(collision)
	print(collision)
	
func launch():
	velocity = (Vector2(speed, 0)).rotated(rotation)

func on_impact(collision):
	queue_free()
