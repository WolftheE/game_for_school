extends Label

func _process(delta):
	# Get the current FPS
	var fps = Engine.get_frames_per_second()
	
	# Update the label's text to show the FPS
	text = "FPS: %d" % fps
