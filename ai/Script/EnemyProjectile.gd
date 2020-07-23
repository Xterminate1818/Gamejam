extends KinematicBody2D
class_name EnemyProjectile

export var speed = 150
var velocity = Vector2.ZERO
var damage = 0.5

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		on_impact(collision)
	
func launch_rotated():
	velocity = (Vector2(speed, 0)).rotated(rotation)

func launch_vector(vector):
	velocity = vector.normalized() * speed

func on_impact(collision):
	if collision.collider.has_method("get_type") && collision.collider.get_type() == "player":
		var c = collision.collider
		c.health -= damage
	queue_free()
