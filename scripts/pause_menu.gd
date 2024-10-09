extends Node3D

@onready var PauseMenu = $pause_menu

var paused = false

func _ready() -> void:
	Engine.time_scale = 1
	DisplayServer.window_set_title('The Cube I think - Game')

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		pause()

func pause():
	if paused:
		PauseMenu.hide()
		Engine.time_scale = 1
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		PauseMenu.show()
		Engine.time_scale = 0
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	paused = !paused




## the triggers

func _on_area_3d_body_entered(body: Node3D):
	if "CharacterBody3D" in body.name:
		var door = $doorthing
		door.rotation_degrees.y = 0


func _on_wall_pusher_trigger_body_entered(body: Node3D) -> void:
	if "CharacterBody3D" in body.name:
		print('hi')
		$AnimationPlayer.play("wall move")


func _on_changeleveltrigger_body_entered(body: Node3D) -> void:
	get_tree().change_scene_to_file("res://Menu/2d_piss_man_level.tscn")


func _on_area_3d_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if "CharacterBody3D" in body.name:
		get_tree().change_scene_to_file("res://Menu/THE_REAL_ENDING.tscn")
