extends Node2D

class_name GameManager

@export var stateMachine: StateMachine;
var teams: Array[Team] = []

func _ready():
	sb.game_ready.connect(load_teams)
	
	
func load_teams():
		# team 1
	var team1 = TeamData.new();
	team1.teamName = "cavem3n"
	team1.teamColor = Color.RED;
	var bunny1 = BunnyData.new()
	bunny1.bunnyName = "Bald"
	bunny1.weapons.append_array(["Katana", "Bazooka"])
	var bunny2 = BunnyData.new()
	bunny2.bunnyName = "Safe Space"
	bunny2.weapons.append_array(["Grenade", "GrapplingHook"])
	team1.teamBunnies.append_array([bunny1, bunny2])
	
	# team 2
	var team2 = TeamData.new();
	team2.teamName = "go_on city"
	team2.teamColor = Color.BLUE;
	var bunny3 = BunnyData.new()
	bunny3.bunnyName = "Chad Soldier"
	bunny3.weapons.append_array(["Bazooka", "GrapplingHook"])
	var bunny4 = BunnyData.new()
	bunny4.bunnyName = "Cat Blaster"
	bunny4.weapons.append_array(["Katana"])
	team2.teamBunnies.append_array([bunny3, bunny4])
	
	var teams = {}
	teams['1'] = team1;
	teams['2'] = team2;
	
	stateMachine.transition_to("SpawnTeams", teams)
	
func bunny_join_team(bunny: Bunny, team: Team):
	print(bunny.bunnyName, " joined: ", team)
