extends Sprite2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	if "Bullet" in body.name:
		body.queue_free()
		print('PASS')
