extends Node2D

var a = 10
var paused = false
@onready var PauseMenu = $textbox/pause_menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	DisplayServer.window_set_title('Piss Man - Level Intro')
	$cam_zoom.play("camera_move")
	await get_tree().create_timer(1.5).timeout
	$player_stoper/CollisionShape2D3.disabled = false
	await get_tree().create_timer(7).timeout
	$textbox/Panel.visible = true
	$dialog.play("dialog")
	await get_tree().create_timer(4).timeout
	$dialog.play("dialog_2")
	await get_tree().create_timer(3).timeout
	$textbox/Panel.visible = false
	await get_tree().create_timer(1).timeout
	$cam_zoom_out.play("cam_zoom_out")
	await get_tree().create_timer(7).timeout
	$player_stoper.queue_free()
	$PissmanLevelSong1.play()

func _process(delta: float) -> void:
	await get_tree().create_timer(15).timeout
	if $player_stoper == null:
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





# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_area_2d_body_entered(body: Node2D) -> void:
	if "player" in body.name:
		Engine.time_scale = 0
		$textbox/level_done.visible = true


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_2.tscn")


func _on_resume_pressed() -> void:
	pause()


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/Main_menu.tscn")


func _on_respawn_button_pressed() -> void:
	$player2d.global_position = Vector2(0,0)
	$textbox/death_screen.visible = false
	Engine.time_scale = 1


func _on_death_trigger_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		Engine.time_scale = 0
		$textbox/death_screen.visible = true
