extends Node2D
# Main Menu Code by Daniel 
# TODO FIX THE MAIN MENU IT LOOKS HORIBLE 
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

func _on_testlevel_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/2dtopdownfps.tscn")

func _on_testlevel_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/2d_piss_man_level.tscn")

## WHOLE SETTING PART
func _on_play_lowgf_pressed():
	get_tree().change_scene_to_file("res://Menu/main_lowgx.tscn")

func _on_sdfgi_button_toggled(button_pressed):
	Graphics.world_environment.environment.sdfgi_enabled = button_pressed

func _on_glow_button_toggled(toggled_on):
	Graphics.world_environment.environment.glow_enabled = toggled_on

func _on_ssao_button_toggled(toggled_on):
	Graphics.world_environment.environment.ssao_enabled = toggled_on

func _on_ssr_button_toggled(toggled_on):
	Graphics.world_environment.environment.ssr_enabled = toggled_on

func _on_ssil_button_toggled(toggled_on):
	Graphics.world_environment.environment.ssil_enabled = toggled_on

func _on_voxel_gi_button_toggled(toggled_on):
	pass

func _on_showfps_button_toggled(toggled_on):
	get_node("fps").visible = true


func _on_levels_pressed() -> void:
	$level_menu.visible = true


func _on_close_pressed() -> void:
	$level_menu.visible = false


func _on_quit_menu_pressed() -> void:
	$quit_comfirm.visible = true


func _on_button_pressed() -> void:
	$quit_comfirm.visible = false


func _on_credits_pressed() -> void:
	$credits_menu.visible = true


func _on_exit_close_button_pressed() -> void:
	$credits_menu.visible = false


func _on_part_1_intro_pressed() -> void:
	pass # Replace with function body.


func _on_part_1_rtxcon_pressed() -> void:
	$level_menu/Control.visible = true


func _on_nah_pressed() -> void:
	$level_menu/Control.visible = false
