extends TileMap

func _on_Lever_on():
	collision_layer = 2
	visible = true
