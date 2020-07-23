extends Node

func _ready():
	Player.current_scene = ("res://levels/Level 1a.tscn")
	print(Player.current_scene)
