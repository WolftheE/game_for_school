extends Sprite2D
@onready var gun = self
@export var direc = 1
func _process(delta: float) -> void:
	if $"..".velocity.x > 0:
		gun.scale = Vector2(1,1)
		$"../bulet_spawner".position = Vector2(21,-11)
		Global.left = 0
	if $"..".velocity.x < 0:
		gun.scale = Vector2(-1,1)
		$"../bulet_spawner".position = Vector2(-21,-11)
		Global.left = 1
