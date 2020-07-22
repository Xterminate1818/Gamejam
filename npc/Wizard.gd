extends KinematicBody2D

var velocity = Vector2.ZERO
var line0 = ""
var line1 = "Good, you've finally made it!"
var line2 = "This will be the final stage of your training."
var line3 = "Even so, this final test will be no picnic..."
var line4 = "I have faith in your abilities, my apprentice."
var line5 = "Go on ahead, I'll meet you at the end of The Labyrinth."
var lines = [line0, line1, line2, line3, line4, line5]

var line_number = 0
var current_line

func _process(delta):
	var p = Player.position
	if p.x > position.x:
		$Sprite.flip_h = false
	if p.x < position.x:
		$Sprite.flip_h = true
	current_line = lines[line_number]
	$Label.text = current_line

func _physics_process(delta):
	velocity.y += 20
	velocity = move_and_slide(velocity)

func next_line():
	if line_number != 5:
		$Typewriter.play("Typewriter")
		line_number = clamp(line_number + 1, 0, 5)
	else:
		$Timer.stop()
		pass

func _on_Timer_timeout():
	next_line()

func _on_Delay_timeout():
	next_line()
	$Timer.start()
