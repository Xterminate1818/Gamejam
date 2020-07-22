extends Area2D
class_name Collectable

export var ID: int = 0

func _on_Area2D_body_entered(body):
	if body.get("Inventory") != null:
		body.Inventory.add_item(ID)
		Player.unlocked.append(ID)
		queue_free()
