extends Node3D

func _ready() -> void:
	if Graphics.voxel_gi == 1:
		$VoxelGI2.visible = true

func _on_area_3d_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if "CharacterBody3D" in body.name:
		$move.play("push")


func _on_area_3d_2_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if "CharacterBody3D" in body.name:
		$"KevinMacLeod-FluffingADuck".playing = false
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://levels/credits_outro.tscn")
