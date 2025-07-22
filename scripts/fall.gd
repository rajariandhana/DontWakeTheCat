extends RigidBody2D

@export var path_speed = 150
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("ground"):
		print("GROUND")
		queue_free()
		
