extends Area2D

export var Item: PackedScene

func _on_Area2D_body_entered(body):
	print(body)
