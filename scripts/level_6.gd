extends Node2D

var paused = false
@onready var PauseMenu = $textbox/pause_menu


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = 1
	DisplayServer.window_set_title('Piss Man - Level 6')



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
		$textbox/level_done.visible = true
		$LevelDone.playing = true
		Engine.time_scale = 0


func _on_respawn_button_pressed() -> void:
	Engine.time_scale = 1
	$textbox/death_screen.visible = false
	$player2d.global_position = Vector2(0,0)


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/Main_menu.tscn")


func _on_resume_pressed() -> void:
	pause()


func _on_dialog_trigger_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name: 
		$textbox/Panel.visible = true
		$AnimationPlayer.play("dialog")
		await get_tree().create_timer(31).timeout
		$player_stoper.queue_free()
		$dialog_trigger.queue_free()
		$textbox/Panel.visible = false


func _on_transion_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		$AnimationPlayer2.play("fade_screen")
		await get_tree().create_timer(1.6).timeout
		get_tree().change_scene_to_file("res://levels/level_7.tscn")
		
