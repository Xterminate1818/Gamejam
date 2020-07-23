extends TileMap

func _on_Lever_on():
	$AnimationPlayer.play("Appearing Platform")


func _on_Lever_off():
	queue_free()
