extends Node2D
@onready var bullet_left = preload("res://Others/bullet_left.tscn")
@onready var bullet_right = preload("res://Others/bullet_right.tscn")
var can_shoot = 1
var boss_dead = 0
var stage = 0

func _ready() -> void:
	DisplayServer.window_set_title('Boss.level')
	$death.play("RESET")
	Engine.time_scale = 1
	## 50 numbers in total
	NullHeath.heath = (1 + 1 + 1 + 1 + 1 + 1 + 1
	 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 
	1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 
	+ 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 
	+ 1 + 1 + 1 + 1 + 1 + 1 )
	PlayerHeath.playerheath = 5
	await get_tree().create_timer(4).timeout
	$textbox/Label.hide()

func _process(delta: float) -> void:
	#pissman Health system
	if PlayerHeath.playerheath == 5:
		pass
	elif PlayerHeath.playerheath == 4:
		$textbox/pissman_health/BoxContainer/TextureRect4.hide()
	elif PlayerHeath.playerheath == 3:
		$textbox/pissman_health/BoxContainer/TextureRect3.hide()
	elif PlayerHeath.playerheath == 2:
		$textbox/pissman_health/BoxContainer/TextureRect2.hide()
	elif PlayerHeath.playerheath == 1:
		$textbox/pissman_health/BoxContainer/TextureRect.hide()
	elif PlayerHeath.playerheath == 0:
		DisplayServer.window_set_title('You died lol')
		$textbox/pissman_health/BoxContainer/TextureRect5.hide()
		$death.play("death")
		$player.hide()
		$GPUParticles2D.global_position = $player.global_position
		$GPUParticles2D.emitting = true
		Engine.time_scale = 0.01
		$BossMusicFile.playing = false

	
	# updates the player health
	$textbox/pissman_health/health.text = str(PlayerHeath.playerheath, "/5")
	
	#updates the null health
	$textbox/nullman_health/Label.text = str(NullHeath.heath, "/50")

	if NullHeath.heath == 49:
		$"textbox/nullman_health/BoxContainer/TextureRect".hide()
	elif NullHeath.heath == 45:
		if stage == 0:
			stage = 1
			$"wall_crusher".play("crush")
	elif NullHeath.heath == 38:
		if stage == 1:
			stage = 2
			$"wall_crusher".play("crush_2")
	elif NullHeath.heath == 33:
		$"textbox/nullman_health/BoxContainer/TextureRect5".hide()
		if stage == 2:
			stage3()
	elif NullHeath.heath == 20:
		$"textbox/nullman_health/BoxContainer/TextureRect4".hide()
	elif NullHeath.heath == 10:
		$"textbox/nullman_health/BoxContainer/TextureRect3".hide()
	
	if NullHeath.heath == 0:
		if boss_dead == 0:
			player_killed_null()

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()

func stage3():
	stage = 3
	$"wall_crusher".play("crush_3")
	await get_tree().create_timer(7).timeout
	$"spikes_fall_ani".play("spike_fall")
	await get_tree().create_timer(20).timeout
	$"floor_move_up".play("floor_up")


func player_killed_null():
	boss_dead = 1
	$textbox/dialog.visible = true
	$BossMusicFile.playing = false
	$script.play("1")
	await get_tree().create_timer(9).timeout
	$textbox/nullman_health/BoxContainer/TextureRect6.visible = true
	$textbox/nullman_health/BoxContainer/TextureRect7.visible = true
	$textbox/nullman_health/BoxContainer/TextureRect8.visible = true
	$textbox/nullman_health/BoxContainer/TextureRect9.visible = true
	$textbox/nullman_health/BoxContainer/TextureRect10.visible = true
	$textbox/nullman_health/BoxContainer/TextureRect11.visible = true
	$textbox/nullman_health/BoxContainer/TextureRect12.visible = true
	$textbox/nullman_health/BoxContainer/TextureRect.visible = true
	$textbox/nullman_health/BoxContainer/TextureRect2.visible = true
	$textbox/nullman_health/BoxContainer/TextureRect3.visible = true
	$textbox/nullman_health/BoxContainer/TextureRect4.visible = true
	$textbox/nullman_health/BoxContainer/TextureRect5.visible = true
	await get_tree().create_timer(11).timeout
	$kill_player_for_once.play("player")


func shoot():
	if Global.left == 1 and can_shoot == 1:
		can_shoot -= 1
		var bullet_thing_left = bullet_left.instantiate()
		var pos = $player/bulet_spawner.global_position
		bullet_thing_left.position = Vector2(pos)
		add_child(bullet_thing_left)
		$GunShot.playing = true
		await get_tree().create_timer(0.4).timeout
		can_shoot += 1
	
	if Global.left == 0 and can_shoot == 1:
		can_shoot -= 1
		var bullet_thing_right = bullet_right.instantiate()
		var pos = $player/bulet_spawner.global_position
		bullet_thing_right.position = Vector2(pos)
		add_child(bullet_thing_right)
		$GunShot.playing = true
		await get_tree().create_timer(0.4).timeout
		can_shoot += 1


func dead():
	Engine.time_scale = 0

# hurt trigger
func _on_damage_trigger_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		PlayerHeath.playerheath -= 1
		$ButtonClickSoundEffect.playing = true
		$player_flasher.play("hit")


func _on_respawn_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/boss_fight.tscn")
	$death.play("RESET")

	


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		PlayerHeath.playerheath -= 1
		$ButtonClickSoundEffect.playing = true
		$player_flasher.play("hit")


func _on_change_level_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		get_tree().change_scene_to_file("res://levels/THE_ENDING_1.tscn")
