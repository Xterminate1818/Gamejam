extends Timer



func _on_Leap_body_entered(body):
	start()
	


func _on_Timer_timeout():
	Player.respawn()
	get_tree().change_scene("res://levels/Campaign/Level 1/Level 1a.tscn")
