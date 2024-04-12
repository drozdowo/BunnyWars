class_name FireVelocityMeter extends Control

@onready var progressBar = $ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	progressBar.value = 1
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progressBar.value += 0.33;
	pass

func getValue():
	return progressBar.value
	
func setPos(pos: Vector2):
	global_position = pos
