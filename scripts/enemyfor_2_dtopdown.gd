extends CharacterBody2D

var motion = Vector2()

# For the enemy to move towards the player
func _physics_process(delta: float) -> void:
	var Player = get_parent().get_node("Playertopdown2d")
	
	position += (Player.position - position)/50
	look_at(Player.position)
	
	move_and_collide(motion)
