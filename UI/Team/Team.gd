class_name Team 

var _teamName: String;
var _teamColor: Color;
var _bunnies: Array[Bunny];
var _teamDisplay: TeamDisplay;

func _init(_data: TeamData):
	self._teamName = _data.teamName;
	self._teamColor = _data.teamColor;
	sb.bunny_join_team.connect(add_bunny)
	sb.teams_spawned.connect(load_health)

func add_bunny(bunny: Bunny, team: Team):
	if team == self:
		_bunnies.append(bunny);
		bunny.take_damage.connect(take_damage)

func take_damage(newHealth: float):
	var curHp: float = 0;
	var totalHp: float = len(_bunnies) * 100;
	for bunny in _bunnies:
		curHp += bunny.health;
	_teamDisplay.teamHealth.value = curHp
		
func load_health():
	print("test:", len(_bunnies))
	_teamDisplay.teamHealth.max_value = len(_bunnies) * 100
	_teamDisplay.teamHealth.value = len(_bunnies)  * 100
	
func _ready():
	_teamDisplay.teamName.text = _teamName;
