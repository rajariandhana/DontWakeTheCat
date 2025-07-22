extends Node2D

@onready var timer: Timer = $PlayTimer
@onready var label: Label = $Label
@onready var sleeping_state: OptionButton = $"sleeping-state"
@onready var cat: AnimatedSprite2D = $Cat

var elapsed_time = 1
const GAME_DURATION = 90

var touchables = []

func _ready() -> void:
	randomize()
	touchables = get_tree().get_nodes_in_group("touchables")
	update_timer_display()
	timer.start()

func update_timer_display():
	label.text = "Until Morning: %s s" % [str(GAME_DURATION - elapsed_time)]

func _on_timer_timeout() -> void:
#TODO: make the chance faster as the game continues
	elapsed_time += 1
	update_timer_display()
	var chance = randi_range(1,10)
	if chance > 7:
		var id = randi_range(0,touchables.size()-1)
		print("on ", id)
		touchables[id].on()
	if elapsed_time >= GAME_DURATION:
		timer.stop()

func _on_sleepingstate_item_selected(index: int) -> void:
	cat.sleep_state(index)
