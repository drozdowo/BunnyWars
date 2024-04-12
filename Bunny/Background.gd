class_name BunnyOverheadBackground extends ColorRect

@onready var parent_bunny: Bunny = get_parent().get_parent().get_parent()
@onready var borders: Array[ColorRect] = [$"../Top", $"../Right", $"../Bottom", $"../Left"]

@export var inactive_color: Color = Color('00000033')
@export var active_color: Color = Color('00000000')

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if parent_bunny.isActive:
		for border in borders:
			border.color = active_color
	else:
		for border in borders:
			border.color = inactive_color
	pass
