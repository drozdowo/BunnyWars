class_name Weapon extends Resource

enum WEAPON_TYPES {
	MELEE,
	HITSCAN,
	THROWABLE,
	PROJECTILE,
	UTILITY,
	GLOBAL,
}

@export
var WEAPON_NAME: String;

@export
var WEAPON_TYPE: WEAPON_TYPES;

@export
var WEAPON_SPRITE: CompressedTexture2D;

@export var WEAPON_DAMAGE: float;

func equip(mount: WeaponMount):
	print('equipped', WEAPON_NAME)

func fire(mount: WeaponMount, speed: float):
	print('fire', WEAPON_NAME)
	
func canAdjustVelocity():
	return WEAPON_TYPE == WEAPON_TYPES.PROJECTILE or WEAPON_TYPE == WEAPON_TYPES.THROWABLE
