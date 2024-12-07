extends Area2D

# Declare variable for use in Inspector
@export var speed: float = 300.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Wire up our inputs
	# Paddle moving left
#	if Input.is_action_pressed("left"):
#		position.x -= speed * delta

	# Paddle moving right
#	elif Input.is_action_pressed("right"):
#		position.x += speed * delta
		
	# Could also do this to handle paddle movement
	position.x += delta * speed * Input.get_axis("left", "right")
