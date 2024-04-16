extends WeaponBase

@export_category("Grenade")
@export var grenade: PackedScene;

func fire(speed: float = 1):
	ThrowableBase.instantiateAndThrow(grenade, global_position, global_rotation, speed);
