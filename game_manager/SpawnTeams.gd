class_name SpawnTeamsState extends State

var bunnies: Array[Bunny] = [];
var turnOrder: Array[Bunny] = [];

func enter(msg = {}):
	print(msg)
	for i in msg:
		var teamData : TeamData = msg[i]
		var team = Team.new(teamData)
		sb.add_team.emit(team)
		for bunny: BunnyData in teamData.teamBunnies:
			print("spawning:", bunny.as_string())
			var spawn: Node = get_tree().get_nodes_in_group(Groups.BUNNY_SPAWN).pick_random()
			var bunnyScene = preload("res://Bunny/bunny.tscn")
			var spawned: Bunny = bunnyScene.instantiate().with_data(bunny)
			Consts.root.add_child(spawned)
			spawned.bunnyName = bunny.bunnyName;
			spawned.position = spawn.position
			(spawn as Node).remove_from_group(Groups.BUNNY_SPAWN)
			spawn.queue_free()
			bunnies.append(spawned);
			sb.bunny_join_team.emit(spawned, team)
	sb.teams_spawned.emit()
