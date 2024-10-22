extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DisplayServer.window_set_title(' ')
	$AnimationPlayer.play("logo Intro")
	$IntroSound.playing = true
	await get_tree().create_timer(3.5).timeout
	$IntroSound.pitch_scale = 0.6
	$IntroSound.playing = true
	if get_tree() == null:
		pass
	else:
		await get_tree().create_timer(11).timeout
		$RedotSoundEffect.playing = true
		await get_tree().create_timer(5.5).timeout
		$"wolfe logo".visible = false
		$Control.visible = true
		$text.play("text")
		await get_tree().create_timer(5.1).timeout
		$Fartmeme.playing = true
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://Menu/Main_menu.tscn")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("back"):
		get_tree().change_scene_to_file("res://Menu/Main_menu.tscn")
