class_name GameInitializationState extends State

func enter(_msg = {}):
	print("Game Initialized")
	sb.game_ready.emit();
	

