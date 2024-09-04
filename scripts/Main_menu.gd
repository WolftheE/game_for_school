extends Node2D
# Main Menu Code by Daniel 
# TODO FIX THE MAIN MENU IT LOOKS HORIBLE 
# TODO Make a level selections
var simultaneous_scene = preload("res://Menu/main.tscn").instantiate()
var cube = preload("res://Models/cube.tscn")
var world_environment = WorldEnvironment
@onready var voxel_gi = get_node("VoxelGI")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("jump") or Input.is_action_just_pressed("left_click"):
		spawn_object()

#Code for a little fun thing on the main menu (thanks chatgpt)
func spawn_object():
	var cube_possition = cube.instantiate()
	var pos = $Spawner.position
	cube_possition.position = Vector2(pos)
	add_child(cube_possition)

# Code for the buttons
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Menu/main.tscn")


func _on_quit_pressed():
	get_tree().quit()

func _on_settings_pressed() -> void:
	$Control.visible = true

func _on_close_options_menu_pressed() -> void:
	$Control.visible = false



## WHOLE SETTING PART
func _on_play_lowgf_pressed():
	get_tree().change_scene_to_file("res://Menu/main_lowgx.tscn")

func _on_sdfgi_button_toggled(toggled_on: bool) -> void:
	Graphics.world_environment.environment.sdfgi_enabled = toggled_on

func _on_glow_button_toggled(toggled_on: bool) -> void:
	Graphics.world_environment.environment.glow_enabled = toggled_on

func _on_ssao_button_toggled(toggled_on: bool) -> void:
	Graphics.world_environment.environment.ssao_enabled = toggled_on

func _on_ssr_button_toggled(toggled_on: bool) -> void:
	Graphics.world_environment.environment.ssr_enabled = toggled_on

func _on_ssil_button_toggled(toggled_on: bool) -> void:
	Graphics.world_environment.environment.ssil_enabled = toggled_on

func _on_voxel_gi_button_toggled(toggled_on: bool) -> void:
	get_node("VoxelGI").visible = false

func _on_showfps_button_toggled(toggled_on: bool) -> void:
	get_node("fps").visible = true
