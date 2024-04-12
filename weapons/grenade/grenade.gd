class_name Grenade extends Weapon

var grenade = preload("res://weapons/grenade/grenadethrown.tscn")

func _init():
	WEAPON_NAME = 'Grenade'
	WEAPON_TYPE = WEAPON_TYPES.THROWABLE
	WEAPON_SPRITE = preload("res://weapons/grenade/lettucegrenade.png")

func equip(mount: WeaponMount):
	print('equipped', WEAPON_NAME)

func fire(mount: WeaponMount, speed: float):
	ThrowableBase.instantiateAndThrow(grenade, mount.global_position, mount.global_rotation, speed)
