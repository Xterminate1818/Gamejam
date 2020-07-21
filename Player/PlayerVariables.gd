extends Node

var position: Vector2 = Vector2()
var health: float = -1
var energy: float = -1
var unlocked: Array = [Globals.Conduit2]

func respawn():
	health = -1
	energy = -1

func reset_magic():
	unlocked = []
