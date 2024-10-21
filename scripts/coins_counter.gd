extends Label



func _process(delta: float) -> void:
	self.text = str('Coins = ', Global.score)


func _on_coin_1_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	$"../../coin1".queue_free()
	Global.score += 1
	$"../../CoinSound(3)".playing = true
	await get_tree().create_timer(2).timeout
	$"../../CoinSound(3)".playing = false
