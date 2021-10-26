extends KinematicBody2D

const PLAYER_SPEED = 100

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if input_vector != Vector2.ZERO:
		update_direction(input_vector)
		input_vector = input_vector.normalized() * PLAYER_SPEED
	
	move_and_collide(input_vector*delta)

func update_direction(input):
	if input.x:
		get_child(0).set_flip_h(input.x > 0)
