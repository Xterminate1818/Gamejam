extends Node

onready var MainMusic: AudioStreamPlayer = $MainMusic
onready var Ambience: AudioStreamPlayer = $Ambience

func _process(delta):
	if Player.current_scene == "res://levels/Campaign/Credits.tscn":
		MainMusic.playing = false
		Ambience.playing = false
	else:
		if not MainMusic.playing:
			MainMusic.playing = true
		if not Ambience.playing:
			Ambience.playing = true
