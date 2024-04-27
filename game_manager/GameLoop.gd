class_name GameLoopState extends State

var activeBunny: Bunny = null;
var teamOrder: Array[Team];
var curBunnyIndex: int = 0;

func enter(_msg = {}):
	print("start game", _msg.get('teams'))
	teamOrder = _msg.get('teams');
	print(teamOrder[0]._teamName)
	teamOrder[0]._bunnies[curBunnyIndex].isActive = true;
