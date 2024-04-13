class_name TeamManager extends Control

@onready var _teamDisplay = preload("res://UI/Team/TeamDisplay.tscn")
@onready var _grid = $GridContainer

var teamDict = {}

func _init():
	sb.add_team.connect(_on_add_team)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func listenForDamage(bunny: Bunny):
	bunny.take_damage.connect(updateHealth)

func updateHealth(health: float):
	(teamDict['test'] as TeamDisplay).teamHealth.value = health;
	
func _on_add_team(team: Team):
	team._bunnies.all(listenForDamage)
	var teamDisplay: TeamDisplay = _teamDisplay.instantiate()
	var teamColor: StyleBoxFlat = StyleBoxFlat.new()
	teamColor.bg_color = team._teamColor
	_grid.add_child(teamDisplay);
	teamDisplay.teamHealth.add_theme_stylebox_override("fill", teamColor)
	teamDisplay.teamHealth.value = team._bunnies.size() * 100
	teamDisplay.teamName.text = team._teamName
	teamDict[team._teamName] = teamDisplay;
	
	
