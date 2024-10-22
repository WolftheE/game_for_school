extends Node2D
# Main Menu Code by Daniel 
# TODO fix the cube not spawning after going to main menu from pasue menu
var simultaneous_scene = preload("res://Menu/main.tscn").instantiate()
var cube = preload("res://Models/cube.tscn")
var world_environment = WorldEnvironment
@onready var voxel_gi = get_node("VoxelGI")
@onready var option_reso: OptionButton = $Control/Video/BoxContainer/Option_reso

#volume server thing
var main_vol = AudioServer.get_bus_index("Master")
var sfx_vol = AudioServer.get_bus_index("sfx")
var music_vol = AudioServer.get_bus_index("music")
##TODO ADD MUSIC BUS
#var music_vol = AudioServer.get_bus_index("Music")

func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(main_vol, value)
	
	if value == -30:
		AudioServer.set_bus_mute(main_vol,true)
	else:
		AudioServer.set_bus_mute(main_vol,false) 


var Resolutions: Dictionary = {"1920x1080":Vector2i(1920,1080),
							"1280x720":Vector2i(1280,720),
							"2560x1440":Vector2i(2560,1440),
							"3840x2160":Vector2i(3840,2160)}

#resolution thing, Goten from a youtube thing
##TODO Move it down in the code
func _add_resolution():
	for r in Resolutions:
		option_reso.add_item(r)

func _on_option_reso_item_selected(index: int) -> void:
	var ID = option_reso.get_item_text(index)
	get_window().set_size(Resolutions[ID])
	

func _on_fullscreen_pressed() -> void:
	option_reso.set_disabled(true)
	get_window().set_mode(Window.MODE_FULLSCREEN)
	$ButtonClickSoundEffect.playing = true

func _on_windowed_max_pressed() -> void:
	option_reso.set_disabled(true)
	get_window().set_mode(Window.MODE_MAXIMIZED)

func _on_windowed_pressed() -> void:
	option_reso.set_disabled(false)
	get_window().set_mode(Window.MODE_WINDOWED)

#vsync
func _on_vsync_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.time_scale = 1
	_add_resolution()
	DisplayServer.window_set_title('Adventures of Null! - Main Menu')
	$AnimationPlayer.play("coin_move")


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
	$ButtonClickSoundEffect.playing = true
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Menu/main.tscn")


func _on_quit_pressed():
	$ButtonClickSoundEffect.playing = true
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()

func _on_settings_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	$Control.visible = true
	$level_menu.visible = false
	$credits_menu.visible = false
	$quit_comfirm.visible = false

func _on_close_options_menu_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	$Control.visible = false

func _on_testlevel_2_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	get_tree().change_scene_to_file("res://Menu/2dtopdownfps.tscn")

func _on_testlevel_1_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	get_tree().change_scene_to_file("res://Menu/2d_piss_man_level.tscn")

## WHOLE SETTING PART
func _on_play_lowgf_pressed():
	$ButtonClickSoundEffect.playing = true
	get_tree().change_scene_to_file("res://Menu/main_lowgx.tscn")

func _on_sdfgi_button_toggled(button_pressed):
	$ButtonClickSoundEffect.playing = true
	Graphics.world_environment.environment.sdfgi_enabled = button_pressed

func _on_glow_button_toggled(toggled_on):
	$ButtonClickSoundEffect.playing = true
	Graphics.world_environment.environment.glow_enabled = toggled_on

func _on_ssao_button_toggled(toggled_on):
	$ButtonClickSoundEffect.playing = true
	Graphics.world_environment.environment.ssao_enabled = toggled_on

func _on_ssr_button_toggled(toggled_on):
	$ButtonClickSoundEffect.playing = true
	Graphics.world_environment.environment.ssr_enabled = toggled_on

func _on_ssil_button_toggled(toggled_on):
	$ButtonClickSoundEffect.playing = true
	Graphics.world_environment.environment.ssil_enabled = toggled_on

func _on_voxel_gi_button_toggled(toggled_on):
	$ButtonClickSoundEffect.playing = true
	if toggled_on == true:
		Graphics.voxel_gi = 1

	if toggled_on == false:
		Graphics.voxel_gi = 0

func _on_showfps_button_toggled(toggled_on):
	$ButtonClickSoundEffect.playing = true
	get_node("fps").visible = true


func _on_levels_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	$Control.visible = false
	$level_menu.visible = true
	$credits_menu.visible = false
	$quit_comfirm.visible = false

func _on_close_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	$level_menu.visible = false


func _on_quit_menu_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	$Control.visible = false
	$level_menu.visible = false
	$credits_menu.visible = false
	$quit_comfirm.visible = true

func _on_button_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	$quit_comfirm.visible = false


func _on_credits_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	$Control.visible = false
	$level_menu.visible = false
	$credits_menu.visible = true
	$quit_comfirm.visible = false

func _on_exit_close_button_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	$credits_menu.visible = false


func _on_part_1_intro_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Menu/main.tscn")

func _on_part_1_rtxcon_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	$level_menu/Control.visible = true


func _on_nah_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	$level_menu/Control.visible = false


## FOR GRAPHICS MENU OPTIONS THINGY 

func _on_video_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	$Control/graphics_box.visible = false
	$Control/Video.visible = true
	$Control/soundbox.visible = false


func _on_graphics_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	$Control/graphics_box.visible = true
	$Control/Video.visible = false
	$Control/soundbox.visible = false

func _on_sound_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	$Control/soundbox.visible = true
	$Control/Video.visible = false
	$Control/graphics_box.visible = false


func _on_help_pressed() -> void:
	$ButtonClickSoundEffect.playing = true


func _on_part_3_pissman_2_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	get_tree().change_scene_to_file("res://levels/fight_1.tscn")


func _on_part_3_pissman_4_pressed() -> void:
	$ButtonClickSoundEffect.playing = true
	$Window.visible = true
	$level_menu.visible = false


func _on_window_close_requested() -> void:
	$ButtonClickSoundEffect.playing = true
	$Window.hide()


func _on_music_xlider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_vol, value)
	
	if value == -30:
		AudioServer.set_bus_mute(music_vol,true)
	else:
		AudioServer.set_bus_mute(music_vol,false) 


func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_vol, value)
	
	if value == -30:
		AudioServer.set_bus_mute(sfx_vol,true)
	else:
		AudioServer.set_bus_mute(sfx_vol,false) 


func _on_part_3_pissman_3_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/boss_fight.tscn")
