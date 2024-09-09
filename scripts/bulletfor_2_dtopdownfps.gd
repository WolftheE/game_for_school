extends RigidBody2D

# kills the enemy
func _on_area_2d_body_entered(body: Node2D) -> void:
	# Check if the body is an enemy by checking if "enemy" is in its name
	if "enemy" in body.name:
		# Remove (free) the body itself (the enemy)
		body.queue_free()
		queue_free()
	
	elif "cube" in body.name:
		queue_free()
