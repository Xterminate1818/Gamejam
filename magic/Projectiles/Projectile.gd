extends KinematicBody2D
class_name Projectile

export var speed = 300
var velocity = Vector2.ZERO
var energy_cost = 1
var damage = 1
onready var Hit = get_node("Node/Hit")
onready var Hit_Wall = get_node("Node/Hit Wall")

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		on_impact(collision)
	
func launch(wand, effect):
	velocity = (Vector2(speed, 0)).rotated(rotation)
	return energy_cost

func on_impact(collision):
	if collision.collider.has_method("get_type") && collision.collider.get_type() == "enemy":
		var c = collision.collider
		print(c.health)
		c.health -= damage
	queue_free()
