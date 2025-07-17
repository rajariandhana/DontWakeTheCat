extends Node2D

@onready var timer: Timer = $PlayTimer
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_timer_display()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_timer_display()

func update_timer_display():
	var time_left = timer.time_left
	var seconds = int(time_left)
	label.text = "Until Morning: %s s" % [str(seconds)]

func _on_timer_timeout() -> void:
	pass
