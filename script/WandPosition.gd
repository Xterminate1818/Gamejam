extends Position2D

onready var parent = get_parent()

func clear_conduit():
	for c in get_children():
		c.queue_free()

func set_current_conduit(conduit):
	clear_conduit()
	add_child(conduit.instance())

func _process(delta):
	if Input.is_action_pressed("shoot") and get_child_count() != 0 and parent.Stats.energy > 0 and not parent.Inventory.open:
		var energy_cost = get_children()[0].fire(get_parent().Inventory.active_projectile)
		if energy_cost != null:
			parent.energy -= energy_cost
			parent.Stats.interrupt_regen()
