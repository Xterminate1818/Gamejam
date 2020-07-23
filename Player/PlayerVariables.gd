extends Node

var position: Vector2 = Vector2()
var health = null
var energy = null
var unlocked: Array = []
var current_scene: String
var current_wand: int = -1
var current_spell: int = -1

func respawn():
	health = null
	energy = null

func reset_magic():
	unlocked = []
