extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerHeath.playerheath = 3
	Engine.time_scale = 1
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("intro_dialog")
	await get_tree().create_timer(4).timeout
	$options.visible = true
	$dialog.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = str(PlayerHeath.playerheath, "/3")
	
	if PlayerHeath.playerheath == 2:
		$BoxContainer/TextureRect3.visible = false
	elif PlayerHeath.playerheath == 1:
		$BoxContainer/TextureRect2.visible = false
	elif PlayerHeath.playerheath < 1:
		$BoxContainer/TextureRect.visible = false
		$textbox/death_screen.visible = true
		Engine.time_scale = 0
		



func _on_button_pressed() -> void:
	$ButtonClickSoundEffect2.playing = true
	NullHeath.heath -= 1
	
	#checking health to save some cpu performance
	if NullHeath.heath == 2:
		$Nullman/HBoxContainer/TextureRect.visible = false
	elif NullHeath.heath == 1:
		$Nullman/HBoxContainer/TextureRect2.visible = false
	elif NullHeath.heath < 1:
		$Nullman/HBoxContainer/TextureRect3.visible = false
		$dialog.visible = true
		$options.visible = false
		$AnimationPlayer.play("dialog_nullman_died")
		await get_tree().create_timer(4).timeout
		$screen_fade_transmistion.play("fade")
		await get_tree().create_timer(4).timeout
		get_tree().change_scene_to_file("res://levels/level_8.tscn")
		
		pass
	
	
	# what should happen
	if get_tree() == null:
		pass
	else:
		$options.visible = false
		$dialog.visible = true
		$AnimationPlayer.play("dialog_fight1")
		await get_tree().create_timer(6).timeout
		$dialog.visible = false
	
	#bullet_animation
		$bullet/move_bullet.play("bullet_move")
		await get_tree().create_timer(1.7).timeout
		$"NullTalking(1)".playing = true
		await get_tree().create_timer(2).timeout
	# check health
		if NullHeath.heath == 2:
			pass
		elif NullHeath.heath == 1:
			$bullet2/move_bullet.play("bullet_move")
			await get_tree().create_timer(1.7).timeout
			$"NullTalking(1)".playing = true

	
		await get_tree().create_timer(2).timeout
		$options.visible = true
		$bullet/move_bullet.play("RESET")
		



func _on_button_2_pressed() -> void:
	$ButtonClickSoundEffect2.playing = true
	$ButtonClickSoundEffect.playing = true
	$options/VBoxContainer2/Button2.disabled = true
	$dialog.visible = true
	$options.visible = false
	$AnimationPlayer.play("dialog_talk1")
	await get_tree().create_timer(7).timeout
	$dialog.visible = false
	$lava_part.position = Vector2(0,0)
	$lava_animation.play("lava_up")
	await get_tree().create_timer(11).timeout
	$lava_animation.play("RESET")
	$lava_part.position = Vector2(1000,5000)
	$options.visible = true


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		PlayerHeath.playerheath -= 1
		await get_tree().create_timer(1).timeout


func _on_respawn_button_pressed() -> void:
	get_tree().reload_current_scene()
