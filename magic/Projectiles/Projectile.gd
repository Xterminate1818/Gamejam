extends KinematicBody2D
class_name Projectile

export var speed = 300
var velocity = Vector2.ZERO
onready var Hit = get_node("Node/Hit")
onready var Hit_Wall = get_node("Node/Hit Wall")

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		on_impact(collision)
	
func launch(wand, effect):
	velocity = (Vector2(speed, 0)).rotated(rotation)

func on_impact(collision):
	queue_free()
