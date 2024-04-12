class_name BunnySpawnPoint extends Node2D

const SPAWN_POINT_GROUP = 'BUNNY_SPAWN_POINT_GROUP'

@onready var sprite = $Sprite2D
@export var bunnySpawnedHere: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group(SPAWN_POINT_GROUP)
	sprite.visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
