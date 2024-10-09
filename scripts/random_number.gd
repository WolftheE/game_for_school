extends Node

var b = 1
var rdn = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	for b in range(10000):
		rdn.randomize()
		var a = rdn.randi_range(0,1)
		await get_tree().create_timer(2).timeout
		if a == 0:
			$"../MainMenuTheme1".playing = true
			await get_tree().create_timer(32).timeout
			$"../MainMenuTheme1".playing = false
		elif a == 1:
			$"../MainMenuTheme2".playing = true
			await get_tree().create_timer(13).timeout
			$"../MainMenuTheme2".playing = false
			$"../MainMenuTheme2".playing = true
			await get_tree().create_timer(13).timeout
			$"../MainMenuTheme2".playing = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
