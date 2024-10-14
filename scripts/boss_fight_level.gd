extends Node2D

func _ready() -> void:
	$camera_intro.play("cam_zoom_in")
	await get_tree().create_timer(7).timeout
	$dialog_script.play("script_1")
	$Grassman2.visible = true
	await get_tree().create_timer(3).timeout
	$camera_intro.play("cam_zoom_to_him")
	await get_tree().create_timer(3).timeout
	$dialog_script.play("script_2")
	$gun_thrown.play("gun")
	await get_tree().create_timer(0.2).timeout
	$dialog_script.play("script_3")
	$levelstuff/piss_man_feelings.hide()
	$levelstuff/null_feelings.hide()
	await get_tree().create_timer(4).timeout
	$dialog_script.play("script_4")
	await get_tree().create_timer(0.6).timeout
	$camera_intro.play("cam_zoom_over")
	await get_tree().create_timer(17).timeout
	$textbox/Panel.hide()
	$attack_on_grass_man.play("kill")
	await get_tree().create_timer(6).timeout
	$dialog_script.play("script_5")
	await get_tree().create_timer(7).timeout
	$camera_intro.play("camera_zoom_to_gun")
	await get_tree().create_timer(4).timeout
	$player/gun_texture.visible = true
	await get_tree().create_timer(1).timeout
	$textbox/TextureRect.visible = true
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://levels/boss_fight_cutscene.tscn")
	
	
