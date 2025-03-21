extends Node2D

const RAY_LENGTH = 50

func _draw():
	var shoot_vector = get_shoot_vector()
	var parent = get_parent() as Node2D
	if parent == null or shoot_vector == null:
		return
	var parent_pos = parent.global_position
	var line_vector = shoot_vector.normalized() * RAY_LENGTH
	draw_line(Vector2.ZERO, line_vector, Color.DARK_ORCHID, 1, false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	queue_redraw()

func get_shoot_vector():
	return Input.get_vector("shoot_left", "shoot_right", "shoot_up", "shoot_down")
	
