extends Node2D

func _ready() -> void:
	$CreditsMusicSong.play()
	$credits_thing/coins/Label.text = str('you got ', Global.score, ' out of 3 coins')
	$thing.play("cam")
	await get_tree().create_timer(23.5).timeout
	$bg.z_index = 10
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://Menu/Main_menu.tscn")
