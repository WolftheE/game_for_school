extends Area2D

@export var speed = 400

func _process(delta):
	position.x += speed * delta




func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	NullHeath.heath -= 1
	queue_free()
