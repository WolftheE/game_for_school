extends CharacterBody2D
@onready var player = $"../player"
var rdn = RandomNumberGenerator.new()
var charge_time = 1
var speed = 100
var can_move = 1

func _physics_process(delta: float) -> void:

	if position.x <= player.position.x:
		velocity.x = speed
	
	if position.x >= player.position.x:
		velocity.x = -speed
	
	if can_move == 0:
		velocity.x = 0
	
	if charge_time == 1:
		charge()
	
	if NullHeath.heath == 0:
		can_move = 0
	
	# IMPORTANT
	move_and_slide()

func charge():
	rdn.randomize()
	var a = rdn.randi_range(4,12)
	charge_time = 0
	await get_tree().create_timer(a).timeout
	speed = -50
	await get_tree().create_timer(1).timeout
	speed = 800
	await get_tree().create_timer(0.5).timeout
	speed = 100
	charge_time = 1





func _on_bullet_hitbox_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	NullHeath.heath -= 1


func _on_colision_left_body_entered(body: Node2D) -> void:
	if "player" in body.name:
		speed = -25
		PlayerHeath.playerheath -= 1
		$"../player".velocity.y = -650
		await get_tree().create_timer(0.2).timeout
		$"../player".velocity.x = -1000
		speed = 125

func _on_colision_right_body_entered(body: Node2D) -> void:
	if "player" in body.name:
		speed = -25
		PlayerHeath.playerheath -= 1
		$"../player".velocity.y = -650
		await get_tree().create_timer(0.2).timeout
		speed = 125


func _on_top_body_entered(body: Node2D) -> void:
	if "player" in body.name:
		PlayerHeath.playerheath -= 1
		$"../player".velocity.y = -450


func _on_stoper_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		can_move = 0


func _on_stoper_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "player" in body.name:
		can_move = 1
