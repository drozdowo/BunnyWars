class_name BunnySpawnPoint extends Node2D

@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group(Groups.BUNNY_SPAWN)
	sprite.visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
