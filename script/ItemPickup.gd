extends Area2D
class_name Collectable

export var Item: PackedScene

func _on_Area2D_body_entered(body):
	queue_free()
