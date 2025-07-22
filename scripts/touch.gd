extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var isOn:bool
func _ready():
	animated_sprite_2d.play("off")
	isOn=false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#if !(event is InputEventMouse) || !(event.button_index==MOUSE_BUTTON_LEFT && event.is_pressed()):
		#return
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			if isOn:
				off()
			else:
				on()
			#print("The sprite was clicked!")
			# Add your custom code here, like playing an animation

func on():
	animated_sprite_2d.play("on")
	isOn = true
	
func off():
	animated_sprite_2d.play("off")
	isOn = false
