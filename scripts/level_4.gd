extends Node2D

var paused = false
@onready var PauseMenu = $textbox/pause_menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$null_1.visible = true
	Engine.time_scale = 1
	DisplayServer.window_set_title('NULL - Level 4')
	await get_tree().create_timer(2).timeout
	DisplayServer.window_set_title('Piss Man - Level 4')

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



func _on_cutstuff_trigger_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		$cutstuff_trigger.queue_free()
		$AnimationPlayer.play("null jumps")
		$player_stoper/CollisionShape2D.disabled
		await get_tree().create_timer(2.5).timeout
		$textbox/Panel.visible = true
		$Dialog.play("Dialog1")
		await get_tree().create_timer(3).timeout
		$player_stoper.queue_free()
		$textbox/Panel.visible = false


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
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")


func _on_resume_pressed() -> void:
	pause()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_5.tscn")
