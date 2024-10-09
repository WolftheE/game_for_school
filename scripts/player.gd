extends CharacterBody3D
# PS: Some of the code came with godot as a template by defualt
##TODO Fix camera Cliping (we all know Daniel will not fix it)

# Varibles that will be used
const SPEED = 5.0
const JUMP_VELOCTIY = 4.5
@onready var pivot = $pivot

#TODO DANIEL PLEASE REMEBER TO CHANGE THE SENS TO BE A OPTION ON THE MAIN MENU
@export var sens = -0.3

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(event.relative.x * sens))
		pivot.rotate_x(deg_to_rad(event.relative.y * sens))
		#TODO !!VERY IMPORTANT!! this is the most buggest way to fix cammera over rotating but for now it a replacement untill Daniel can figure out how to fix it
		pivot.rotation.x = clamp(pivot.rotation.x, deg_to_rad(-90), deg_to_rad(45))

func _physics_process(delta):
	# Gravity or somthing idk
	if not is_on_floor():
		velocity.y -= gravity * delta  
	
	# Jump thingy
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCTIY
	
	
	# Player Movement Script that came with godot so i did not code this
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	# the amount of times i fogot to include the "move_and_slide()" thing....
	move_and_slide()
	
