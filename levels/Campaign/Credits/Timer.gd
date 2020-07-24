extends Timer

onready var DamageCD = $DamageCD

func _on_Timer_timeout():
	if DamageCD.is_stopped():
		Player.current_scene = "res://levels/Campaign/End/End.tscn"
		get_tree().change_scene("res://levels/Campaign/End/End.tscn")
