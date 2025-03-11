extends Node2D

const RAY_LENGTH = 50

var last_mouse_pos: Vector2

func _draw():
	var parent = get_parent() as Node2D
	if parent == null or last_mouse_pos == null:
		return
	var parent_pos = parent.global_position
	var delta_pos = last_mouse_pos - parent_pos
	var line_vector = delta_pos.normalized() * RAY_LENGTH
	draw_line(parent_pos, parent_pos + line_vector, Color.AQUAMARINE, 1, false)
	
func _process(delta):	
	draw_ray_to_mouse()
	
func draw_ray_to_mouse():
	last_mouse_pos = get_global_mouse_position()
	queue_redraw()
