class_name TeamManager extends Control

@onready var _teamDisplay = preload("res://UI/Team/TeamDisplay.tscn")
@onready var _grid = $TeamOutline/GridContainer
@onready var camera: Camera2D = $"../"
@onready var turnTimerLabel: Label = $TurnTimerOutline/TurnTimer

var teamDict = {}

func _init():
	sb.add_team.connect(_on_add_team)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _process(delta):
	scale = Vector2(1 / camera.zoom.x, 1 / camera.zoom.y)
		
func _on_add_team(team: Team):
	print("adding team:", team._teamName, len(team._bunnies))
	var teamDisplay: TeamDisplay = _teamDisplay.instantiate()
	var teamColor: StyleBoxFlat = StyleBoxFlat.new()
	teamColor.bg_color = team._teamColor
	_grid.add_child(teamDisplay);
	team._teamDisplay = teamDisplay;
	teamDisplay.teamHealth.add_theme_stylebox_override("fill", teamColor)
	teamDisplay.teamName.text = team._teamName
	teamDict[team._teamName] = teamDisplay;
	
	
