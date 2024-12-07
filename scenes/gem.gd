extends Area2D

# Create class name Gem
class_name Gem

# create signal on_gem_off_screen
signal on_gem_off_screen

# Declare variable for use in Inspector
@export var speed: float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# change position y downward 100 units against every delta
	position.y += speed * delta
	
	# when position reaches the bottom of the viewport...
	if position.y > get_viewport_rect().size.y:
		# Emits on_gem_off_screen signal
		on_gem_off_screen.emit()
		# sets _process function to false, meaning it is no longer invoked
		set_process(false)
		# remove the object from the viewport
		queue_free()
		
	
	
