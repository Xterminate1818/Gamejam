extends Node

onready var MainMusic: AudioStreamPlayer = $MainMusic
onready var Ambience: AudioStreamPlayer = $Ambience

func _process(delta):
	if not MainMusic.playing:
		MainMusic.playing = true
	if not Ambience.playing:
		Ambience.playing = true
