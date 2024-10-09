extends Control

@onready var main = get_parent()

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Menu/Main_menu.tscn")



func _on_resume_pressed():
	main.pause()
