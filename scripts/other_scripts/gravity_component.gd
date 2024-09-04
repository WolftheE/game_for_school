class_name GravityComponent
extends Node

@export_subgroup("Settings_value")
@export var gravity: float = 1000.0

var is_falling: bool = false

func handle_gravity(body: CharacterBody2D, dalta: float) -> void:
	if not body.is_on_floor():
		body.velocity.y += gravity * delta

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
