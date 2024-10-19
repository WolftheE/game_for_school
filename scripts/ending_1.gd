extends Node2D

func _ready() -> void:
	await get_tree().create_timer(2).timeout
	$cam_zoom.play("cam")
	await get_tree().create_timer(6).timeout
	get_tree().change_scene_to_file("res://levels/credits_outro.tscn")
