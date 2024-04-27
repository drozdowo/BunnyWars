class_name GameLoopState extends State

var activeBunny: Bunny = null;

func enter(_msg = {}):
	_msg["bunny"].isActive = true;
	activeBunny = _msg["bunny"]
	sb.bunny_start_turn.emit(activeBunny)
	sb.bunny_finished_turn.connect(finished_turn)
	
func finished_turn():
	state_machine.transition_to("TurnEnd", {"bunny": activeBunny})
