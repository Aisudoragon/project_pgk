extends CharacterBody2D


const SPEED = 60.0
const JUMP_VELOCITY = -200.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Move left", "Move right")
	if direction:
		if is_on_floor():
			velocity.x = direction * SPEED
			$AnimatedSprite2D.play("default")
			if velocity.x < 0:
				$AnimatedSprite2D.flip_h = true
			else:
				$AnimatedSprite2D.flip_h = false
		$Camera2D.offset.x = 50 * direction
	else:
		if is_on_floor():
			velocity.x = move_toward(velocity.x, 0, SPEED)
			$AnimatedSprite2D.stop()
			



	move_and_slide()
