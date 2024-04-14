class_name Grenade extends Weapon

var grenade = preload("res://weapons/grenade/grenadethrown.tscn")

func equip(mount: WeaponMount):
	print('equipped', WEAPON_NAME)

func fire(mount: WeaponMount, speed: float):
	var thrown: ThrowableBase = ThrowableBase.instantiateAndThrow(grenade, mount.global_position, mount.global_rotation, speed)
	thrown.damage = WEAPON_DAMAGE
