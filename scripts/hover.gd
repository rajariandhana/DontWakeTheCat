extends PathFollow2D

@export var path_speed = 600
@onready var timer: Timer = $Timer

@export var fall_scene: PackedScene
var direction = 1

func _ready() -> void:
	self.progress_ratio = randf_range(0.0,1.0)
	if randi_range(0,1)==0:
		direction=-1
	timer.connect("timeout",_on_timer_timeout)

func _process(delta: float) -> void:
	self.progress += path_speed * delta * direction

func _on_timer_timeout() -> void:
	print("DROPPING")
	var fall_instance = fall_scene.instantiate()
	fall_instance.global_position = self.global_position
	get_parent().add_child(fall_instance)
	queue_free()
	#current_state = State.DROPPING
	#self.freeze = false
	#var path_direction = Vector2.RIGHT.rotated(path_follow_2d.rotation)
	#self.linear_velocity = path_direction * path_speed
