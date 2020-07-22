extends Node

var position: Vector2 = Vector2()
var health = null
var energy = null
var unlocked: Array = []
var current_scene: String setget set_scene

func respawn():
	health = null
	energy = null

func reset_magic():
	unlocked = []

func set_scene(new):
	print(new)
	current_scene = new
