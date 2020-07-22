extends Node

var position: Vector2 = Vector2()
var health = null
var energy = null
var unlocked: Array = []
var current_scene: String

func respawn():
	health = null
	energy = null

func reset_magic():
	unlocked = []
