extends Area2D

func _on_Area2D_body_entered(body):
	if body.get("Inventory") != null:
		body.Inventory.add_item(Globals.Conduit2)
		queue_free()
