extends WeaponBase

func fire(power: float = 1):
	sb.bunny_finished_turn.emit(bunny)
