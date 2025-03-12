extends CharacterBody2D

@export var acceleration = 800
@export var friction = 500
@export var max_speed = 200
@export var starting_direction : Vector2 = Vector2(0, 1)

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _ready():
	update_animation_parameters(starting_direction)
	animation_tree.set('parameters/Idle/blend_position', starting_direction)

func _physics_process(delta):
	var input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	update_animation_parameters(input_vector)
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	update_animation_state()
	move_and_slide()

func update_animation_parameters(move_input : Vector2):
	if (move_input != Vector2.ZERO):
		animation_tree.set("parameters/Idle/blend_position", move_input)
		animation_tree.set("parameters/Walk/blend_position", move_input)

func update_animation_state():
	if velocity != Vector2.ZERO:
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")
