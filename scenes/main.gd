extends Node2D
const PI: float = 3.1415


# Called when the node enters the scene tree for the first time.
func _ready():
	$pen_fighter.position = Vector2(-500,0)
	$pen_fighter.rotation = PI/2
	$pen_fighter2.position = Vector2(0,0)
	$pen_fighter2.rotation = PI/2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	pass
	
	

func _on_hitter_hit__(hit_force, hit_doirection, hit_position):
	print("HIT FORCE =", hit_force," HTI DIRECTION =", hit_doirection," HIT POSITION = ", hit_position)
	var direction = hit_doirection.normalized()
	var impulse_vector = direction * hit_force
	$pen_fighter.apply_impulse(-impulse_vector, Vector2(40,-40))
