extends KinematicBody2D
class_name Projectile

export var speed = 100
var velocity = Vector2.ZERO

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		on_impact()

func launch(direction: Vector2):
	velocity = direction * speed

func on_impact():
	queue_free()