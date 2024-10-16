extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = 1
	DisplayServer.window_set_title('Piss Man - Level 9')


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		DisplayServer.window_set_title('Piss Man - NULL')
		$PissmanLevelSong2.playing = false
		$"CORUPTION/1/TextureRect".visible = false
		$"CORUPTION/1/TextureRect2".visible = true
		$IntroSound.play()


func _on_death_trigger_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		$textbox/death_screen.visible = true
		Engine.time_scale = 0


func _on_respawn_button_pressed() -> void:
	Engine.time_scale = 1
	$textbox/death_screen.visible = false
	$player2d.global_position = Vector2(0,0)


func _on_change_level_trigger_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	$screen_fade_thing.play("fade")
	await get_tree().create_timer(2.5).timeout
	get_tree().change_scene_to_file("res://levels/fallen_level_1.tscn")
