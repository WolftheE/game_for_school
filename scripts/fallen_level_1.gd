extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.

	





func _on_trigger_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	await get_tree().create_timer(2).timeout
	$textbox/Panel.visible = true
	$script.play("dialog_1")
	await get_tree().create_timer(13).timeout
	$screen_fade_thing.play("fade")
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://levels/boss_fight_level.tscn")
