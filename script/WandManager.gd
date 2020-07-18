extends Position2D

onready var parent = get_parent()
onready var inv = parent.Inventory

func clear_conduit():
	for c in get_children():
		c.queue_free()

func set_current_conduit(conduit):
	clear_conduit()
	add_child(conduit.instance())
