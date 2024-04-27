extends Node2D

class_name GameManager

@export var stateMachine: StateMachine;
var teams: Array[Team] = []

# start with team 0 bunny 0 and go from there
var curTeamIndex: int = 0;
var curBunnyIndex: int = 0;

func _ready():
	sb.game_ready.connect(load_teams)
	sb.add_team.connect(add_team)
	sb.teams_spawned.connect(start_game)
	sb.bunny_finished_turn.connect(bunny_finished_turn)
	sb.post_turn_done.connect(post_turn_done)
	
func add_team(team: Team):
	if randi_range(0,1) == 1:
		teams.append(team);
	else:
		teams.insert(0, team);
	
func start_game():
	# teams are spawned, lets game
	stateMachine.transition_to("DoTurn", {"bunny": get_bunny_turn()})
	
func load_teams():
	# my team:
	var save = FileAccess.open("res://team.save", FileAccess.READ)
	var teamData = JSON.parse_string(save.get_as_text())
	var team1 = TeamData.from_json(teamData)
	
	# team 2
	var team2 = TeamData.new();
	team2.teamName = "go_on city"
	team2.teamColor = Color.BLUE;
	var bunny3 = BunnyData.new()
	bunny3.bunnyName = "Chad Soldier"
	bunny3.weapons.append_array(["Bazooka", "GrapplingHook", "Skip"])
	var bunny4 = BunnyData.new()
	bunny4.bunnyName = "Cat Blaster"
	bunny4.weapons.append_array(["Katana", "Skip"])
	team2.teamBunnies.append_array([bunny3, bunny4])
	
	var teams = {}
	teams['1'] = team1;
	teams['2'] = team2;
	
	stateMachine.transition_to("SpawnTeams", teams)
	
func bunny_join_team(bunny: Bunny, team: Team):
	print(bunny.bunnyName, " joined: ", team)
	
func bunny_finished_turn(bunny: Bunny):
	print("bunny done turn")
	stateMachine.transition_to("TurnEnd", {"bunny": bunny})

func post_turn_done():
	print("okay next bunny turn:")
	stateMachine.transition_to("DoTurn", {"bunny": get_bunny_turn()})
	
# gets the bunny whose turn it should be
func get_bunny_turn():
	var bunny: Bunny = teams[curTeamIndex]._bunnies[curBunnyIndex]
	if (curTeamIndex == len(teams) - 1):
		if (curBunnyIndex == len(teams[0]._bunnies) - 1): curBunnyIndex = 0
		else: curBunnyIndex += 1;
		curTeamIndex = 0;
	else: curTeamIndex += 1
	print("it is ", bunny.bunnyName, "'s turn")
	return bunny;
	
