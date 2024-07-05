extends Node2D

var dragging = false
var length_vector := Vector2.ZERO
var initial_click_position = Vector2.ZERO
var power: float = 0.0
const MAX_POWER__ = 50
signal hit__

#func _ready():
#	# Make sure input processing is enabled
#	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Mouse button just pressed
			show()
			dragging = true
			initial_click_position = get_global_mouse_position()
			position = initial_click_position
			print("Initial mouse click position = ", position)
		else:
			# Mouse button released
			print("HIT!!!!")
			emit_signal("hit__", power, length_vector, initial_click_position)
			dragging = false
			power = 0.0;
			hide()

func _process(delta):
	if dragging:
		# If dragging, update the sprite's rotation to point at the mouse
		$hitter_sprite.flip_h = true
		look_at(get_global_mouse_position())
		length_vector = get_global_mouse_position() - initial_click_position
		power = 0.1*length_vector.length()
		if power >= MAX_POWER__:
			power = MAX_POWER__
		#print("POWER LEVEL =", power)
		
