extends Node

signal fight_done

func _process(delta):
	if get_child_count() < 2:
		emit_signal("fight_done")
