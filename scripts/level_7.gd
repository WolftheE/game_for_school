extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = 1
	DisplayServer.window_set_title('Piss Man - Level 7')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D.global_position = $player.position


func _on_trigger_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		$textbox/Panel.visible = true
		$AnimationPlayer.play("dialog_1")
		await get_tree().create_timer(13).timeout
		$screen_fade_thing.play("fade")
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://levels/fight_1.tscn")
