extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func sleep_state(state: int):
	if state == 0:
		play("sleeping-0")
	elif state == 1:
		play("sleeping-1")
	elif state == 2:
		play("sleeping-2")
	#elif state == 3:
		#play("sleeping-3")
