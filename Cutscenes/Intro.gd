extends CanvasLayer

signal finished

func finished():
	emit_signal("finished")
