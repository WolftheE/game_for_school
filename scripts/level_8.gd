extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("null_man_dies")
	Engine.time_scale = 1
	DisplayServer.window_set_title('Piss Man - Level 8')




func _on_change_level_trigger_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		get_tree().change_scene_to_file("res://levels/level_9.tscn")
