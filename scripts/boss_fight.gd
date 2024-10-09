extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$cool_ass_startup.play("cool_intro")
	await get_tree().create_timer(6).timeout
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
