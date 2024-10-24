extends Node2D

var paused = false
@onready var PauseMenu = $textbox/pause_menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = 1
	DisplayServer.window_set_title('Piss Man - Level 5')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("esc"):
		pause()



func pause():
	if paused:
		PauseMenu.hide()
		Engine.time_scale = 1
	
	else:
		PauseMenu.show()
		Engine.time_scale = 0

	paused = !paused


func _on_death_trigger_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		$textbox/death_screen.visible = true
		Engine.time_scale = 0


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		$LevelDone.playing = true
		$textbox/level_done.visible = true
		Engine.time_scale = 0



func _on_respawn_button_pressed() -> void:
	Engine.time_scale = 1
	$textbox/death_screen.visible = false
	$player2d.global_position = Vector2(0,0)


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")


func _on_resume_pressed() -> void:
	pause()


func _on_coin_1_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	Global.score += 1
	$coin1.queue_free()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_6.tscn")
