extends Node2D

var paused = false
@onready var PauseMenu = $textbox/pause_menu

func _ready() -> void:
	Engine.time_scale = 1
	DisplayServer.window_set_title('Piss Man - Level 2')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D.global_position = $player2d.position
	
	if Input.is_action_just_pressed("esc"):
		pause()
	
	if Input.is_action_pressed("look_down"):
		$Camera2D.offset.y = 0
	else:
		$Camera2D.offset.y = -50


func pause():
	if paused:
		PauseMenu.hide()
		Engine.time_scale = 1
	
	else:
		PauseMenu.show()
		Engine.time_scale = 0

	paused = !paused


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		$textbox/level_done.visible = true
		Engine.time_scale = 0


func _on_button_pressed() -> void:
		get_tree().change_scene_to_file("res://levels/level_3.tscn")
		



func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")




func _on_resume_pressed() -> void:
	pause()


func _on_death_trigger_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		Engine.time_scale = 0
		$textbox/death_screen.visible = true


func _on_respawn_button_pressed() -> void:
	Engine.time_scale = 1
	$textbox/death_screen.visible = false
	$player2d.global_position = Vector2(0,0)
