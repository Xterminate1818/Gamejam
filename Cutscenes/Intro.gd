extends CanvasLayer

signal finished

func finished():
	emit_signal("finished")

func _process(delta):
	if Input.is_action_just_pressed("open"):
		$AnimationPlayer.play("reset")
		emit_signal("finished")
