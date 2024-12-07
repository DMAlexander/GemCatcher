extends Node2D

const EXPLODE = preload("res://assets/spell1_0.wav")

@export var gem_scene: PackedScene

# Can get this by drag Label in while holding CTRL
@onready var label: Label = $Label
@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


var _score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_gem()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Spawn a gem
func spawn_gem() -> void:
	# Instantiate gem
	var new_gem: Gem = gem_scene.instantiate()
	
	# Find random x position for gem spawn point
	var xpos: float = randf_range(70, 1050)
	
	# Adds game over to our list
	new_gem.on_gem_off_screen.connect(game_over)
	
	# Set gem spawn point
	new_gem.position = Vector2(xpos, -50)
	
	# Add child
	add_child(new_gem)
	
func stop_all() -> void:
	timer.stop()
	
	# Iterate through children and stop all
	for child in get_children():
		child.set_process(false)

func play_dead() -> void:
	audio_stream_player_2d.stop()
	audio_stream_player_2d.stream = EXPLODE
	audio_stream_player_2d.play()

# Game over
func game_over() -> void:
	print("Game over")
	stop_all()
	play_dead()

# Call spawn gem
func _on_timer_timeout() -> void:
	spawn_gem()
	print("_on_timer_timeout")


func _on_paddle_area_entered(area: Area2D) -> void:
	_score += 1
	# Create label text
	label.text = "%05d" % _score
	audio_stream_player_2d.position = area.position
	audio_stream_player_2d.play()
	area.queue_free()
