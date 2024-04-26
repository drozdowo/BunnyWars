class_name GameRoot extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	sb.bunny_join_team.connect(add_bunny)
	pass # Replace with function body.

func add_bunny(bunny: Bunny, _team: int):
	add_child(bunny)
