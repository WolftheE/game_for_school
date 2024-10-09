extends CharacterBody2D


## THIS CAME WITH GODOT, CODE WAS MODIFYED BY DANIEL
@onready var anim = $AnimatedSprite2D
@export var SPEED = 225
var direction: Vector2 = Vector2.ZERO
const JUMP_VELOCITY = -400.0

func _on_ready():
	anim.play("idle")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	#ANIMATION THINGG, IT bad but it works
	if Input.is_action_pressed("plat_left") or Input.is_action_pressed("plat_right"):
		anim.play("walking")
	else:
		anim.play('idle')
	
	if velocity.x > 0:
		anim.flip_h = true
		anim.offset = Vector2(-20,-25)
	if velocity.x < 0:
		anim.flip_h = false
		anim.offset = Vector2(20,-25)
	
	# Handle jump.
	if Input.is_action_just_pressed("plat_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("plat_left", "plat_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()




# very unoptimized
