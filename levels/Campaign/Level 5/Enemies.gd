extends Node

signal fight_done

func _process(delta):
	print(get_children())
	if get_child_count() < 2:
		emit_signal("fight_done")
