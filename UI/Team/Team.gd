class_name Team 

var TeamDisplayObject = preload("res://UI/Team/TeamDisplay.tscn")
var _teamName: String;
var _teamColor: Color;
var _order: int;
var _bunnies: Array[Bunny];
var _teamDisplay

func _init(teamName: String, teamColor: Color, order: int, bunnies: Array[Bunny]):
	self._teamName = teamName
	self._teamColor = teamColor
	self._order = order
	self._teamDisplay = TeamDisplayObject.instantiate()
	self._bunnies = bunnies

func _ready():
	_teamDisplay.teamName.text = _teamName;
	_teamDisplay.teamHealth.value = _bunnies.size() * 100
