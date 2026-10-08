extends Sprite2D

# Exported variable: shows up in the Inspector so you can change it
# without editing the code.
@export var speed: float = 200.0

# Keep the character on the grass part of the screen.
const MIN_X := 40.0
const MAX_X := 1112.0
const MIN_Y := 480.0
const MAX_Y := 600.0


func _process(delta: float) -> void:
	var direction := Vector2.ZERO

	# Input + conditional logic (if / elif) for left and right
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	elif Input.is_action_pressed("ui_left"):
		direction.x = -1

	# Same idea for up and down
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	elif Input.is_action_pressed("ui_up"):
		direction.y = -1

	# Hold Space to run (if / else picks which speed to use)
	var current_speed: float
	if Input.is_action_pressed("ui_accept"):
		current_speed = speed * 2.0
	else:
		current_speed = speed

	# Only move if a key is being pressed
	if direction != Vector2.ZERO:
		position += direction.normalized() * current_speed * delta
		position.x = clamp(position.x, MIN_X, MAX_X)
		position.y = clamp(position.y, MIN_Y, MAX_Y)

		# Face the direction we're walking
		if direction.x != 0:
			flip_h = direction.x < 0
