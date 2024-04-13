class_name TeamManager extends Control

@onready var _teamDisplay = preload("res://UI/Team/TeamDisplay.tscn")

var teamDict = {}

func _init():
	connect("add_team", _on_add_team)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_add_team(team: Team):
	print("got add team", team)
	var teamDisplay: TeamDisplay = _teamDisplay.instantiate()
	var tdc: Control = (teamDisplay as Control)
	teamDict[team._teamName] = teamDisplay;
	add_child(teamDisplay)
	#tdc.set_position(Vector2(0,0))
	
	
