extends Area2D

onready var door = get_node("AnimationPlayer")

func _process(delta):
	if get_overlapping_bodies().size() != 0:
		print("1")
		if Input.is_action_pressed("open"):
			Player.current_scene = "res://levels/Level 1.tscn"
			get_tree().change_scene("res://levels/Level 1.tscn")
