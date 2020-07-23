extends Sprite

signal on
signal off

export var lock: bool = true

var active = false

func _process(delta):
	if $Area2D.get_overlapping_bodies().size() != 0:
		$Label.visible = true
		if Input.is_action_just_pressed("open") and not active:
			emit_signal("on")
			active = true
			frame = 1
		elif Input.is_action_just_pressed("open") and active and not lock:
			emit_signal("off")
			active = false
			frame = 0
	else:
		$Label.visible = false
		
