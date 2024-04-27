extends State

# This state will handle events that take place after a bunnies turn

func enter(_msg = {}):
	print("turn over", _msg["bunny"])
	(_msg["bunny"] as Bunny).finish_turn()
	sb.post_turn_done.emit()
