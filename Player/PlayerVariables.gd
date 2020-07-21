extends Node

var position: Vector2 = Vector2()
var health = null
var energy = null
var unlocked: Array = [Globals.Conduit2]
var current_scene: PackedScene

func respawn():
	health = null
	energy = null

func reset_magic():
	unlocked = []

