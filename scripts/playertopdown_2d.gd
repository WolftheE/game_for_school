extends CharacterBody2D

## THIS WAS CODED BY MY SELF WITH SOME HELP FROM ONLINE
#TODO FIX THE CAMERA AND MAKE IT SMOOTHER

# Var which is like pyhton, stores the value
var movespeed = 250
var bullet_speed = 500
var bullet = preload('res://Others/bulletfor2dtopdownfps.tscn')

#MOVEMENT THING
func _physics_process(delta: float) -> void:
	var motion = Vector2()
	
	if Input.is_action_pressed("forward"):
		motion.y -= 1
	if Input.is_action_pressed("back"):
		motion.y += 1
	if Input.is_action_pressed("right"):
		motion.x  += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1
	
	velocity = motion * movespeed
	move_and_slide()
	motion = velocity
	
	# VERY VERY IMPORTANT
	look_at(get_global_mouse_position())
	
	# fire on left click
	if Input.is_action_just_pressed('left_click'):
		_fire()
	
	
	# Cammera smoothing (makes it look 1000x better)
	var camera = get_node("../Camera2D")
	camera.position = camera.position.lerp(global_position, 0.2)  # Adjust the interpolation factor (0.1) for smoothness


# bullet thing
func _fire():
	var bullet_instance = bullet.instantiate()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(bullet_speed, 0).rotated(rotation))  # Ensure bullet has velocity property
	get_tree().get_root().call_deferred("add_child", bullet_instance)

# Kill the enemy you know....
func _kill_player():
	## REPLACE THIS WITH WHATT EVER YOU WANT WHEN THE PLAYER DIES
	get_tree().reload_current_scene() 

# calls the kill player thinggy
func _on_area_2d_body_entered(body: Node2D) -> void:
	if "enemy" in body.name:
		_kill_player()


func _on_exit_level_1_trigger_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://topdownlevels/topdown_level2.tscn")


func _on_remove_wall_trigger_body_entered(body: Node2D) -> void:
	$"../wallthing".queue_free()
