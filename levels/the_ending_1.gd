extends Node2D


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	$Area2D.queue_free()
	$CanvasLayer/script_bg.visible = true
	$dialog.play("script_1")
	await get_tree().create_timer(23).timeout
	$CanvasLayer/script_bg.visible = false
	$CanvasLayer/pick.visible = true


func _on_options_1_pressed() -> void:
	$CanvasLayer/script_bg.visible = true
	$CanvasLayer/pick.visible = false
	$dialog.play("script_2")
	await get_tree().create_timer(14).timeout
	$grassman.visible = false
	$world_colision/CollisionShape2D5.queue_free()
	$GPUParticles2D.emitting = true
	await get_tree().create_timer(3).timeout
	$camera.play("cam_zoom_out")
	$CanvasLayer/script_bg.hide()
	await get_tree().create_timer(3).timeout
	$bg.z_index = 10
	get_tree().change_scene_to_file("res://levels/ending_1.tscn")

func _on_options_2_pressed() -> void:
	$CanvasLayer/script_bg.visible = true
	$CanvasLayer/pick.visible = false
	$dialog.play("script_3")
	await get_tree().create_timer(16).timeout
	$camera.play("cam_zoom_out")
	$CanvasLayer/script_bg.hide()
	await get_tree().create_timer(3).timeout
	$bg.z_index = 10
	$sound.playing = false
	get_tree().change_scene_to_file("res://levels/ending_2.tscn")
