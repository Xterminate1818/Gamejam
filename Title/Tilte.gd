extends Node


func _on_Play_pressed():
	get_tree().change_scene("res://levels/Campaign/Level0.tscn")


func _on_Quit_pressed():
	get_tree().quit()
