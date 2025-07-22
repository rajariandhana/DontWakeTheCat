extends Node2D

@onready var timer: Timer = $PlayTimer
@onready var label: Label = $Label
@onready var sleeping_state: OptionButton = $"sleeping-state"
@onready var cat: AnimatedSprite2D = $Cat
@onready var hover_path: Path2D = $HoverPath

@export var hover_scene: PackedScene

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
	if chance > 5:
		if randi_range(0,1):
			var id = randi_range(0,touchables.size()-1)
			print("on ", id)
			touchables[id].on()
		else:
			var hover_instance = hover_scene.instantiate()
			hover_path.add_child(hover_instance)
			#hover_instance.progress = randf_range(0.0,1.0)
			
	if elapsed_time >= GAME_DURATION:
		timer.stop()

func _on_sleepingstate_item_selected(index: int) -> void:
	cat.sleep_state(index)
