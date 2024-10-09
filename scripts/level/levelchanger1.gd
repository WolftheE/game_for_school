extends Area2D



func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		get_tree().change_scene_to_file("res://levels/level_2.tscn")
