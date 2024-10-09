extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.text = str('Coins = ', Coins_minigame.points_amount)


func _on_min_pointa_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "cube" in body.name:
		Coins_minigame.points_amount -= 50
		print('ohno')


func _on__pointb_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "@Node2D" in body.name:
		Coins_minigame.points_amount += 10


func _on__pointc_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "@" in body.name:
		Coins_minigame.points_amount += 15

func _on__pointd_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if "@" in body.name:
		Coins_minigame.points_amount += 50
