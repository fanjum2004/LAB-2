extends Sprite2D

# Exported variable (shows up in the Inspector)
@export var speed: float = 200.0

func _process(delta):
	# Conditional logic + Input: move when an arrow key is pressed
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
