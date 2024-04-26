class_name Team 

var TeamDisplayObject = preload("res://UI/Team/TeamDisplay.tscn")
var _teamName: String;
var _teamColor: Color;
var _bunnies: Array[Bunny];
var _teamDisplay: TeamDisplay;

func _init(_data: TeamData):
	self._teamName = _data.teamName;
	self._teamColor = _data.teamColor;
	self._teamDisplay = TeamDisplayObject.instantiate();
	sb.bunny_join_team.connect(add_bunny)

func add_bunny(bunny: Bunny, team: Team):
	if team == self:
		_bunnies.append(bunny);

func _ready():
	_teamDisplay.teamName.text = _teamName;
	_teamDisplay.teamHealth.value = _bunnies.size() * 100
