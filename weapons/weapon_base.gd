class_name Weapon extends Resource

signal finished_firing

enum WEAPON_TYPES {
	MELEE,
	HITSCAN,
	THROWABLE,
	PROJECTILE,
	UTILITY,
	GLOBAL,
}

enum WEAPONS {
	BAZOOKA,
	KATANA,
	GRENADE
}

static var WeaponsDict: Dictionary = {
	WEAPONS.BAZOOKA: "res://weapons/bazooka/bazooka.tres",
	WEAPONS.KATANA: "res://weapons/katana/katana.tres",
	WEAPONS.GRENADE: "res://weapons/grenade/grenade.tres"
}

@export_category("Weapon Info")
@export var WEAPON_NAME: String;
@export var WEAPON_TYPE: WEAPON_TYPES;
@export var WEAPON_SPRITE: CompressedTexture2D;
@export var WEAPON_DAMAGE: float;

func equip(mount: WeaponMount):
	print('equipped', WEAPON_NAME)

func fire(mount: WeaponMount, speed: float):
	print('fire', WEAPON_NAME)
	
func canAdjustVelocity():
	return WEAPON_TYPE == WEAPON_TYPES.PROJECTILE or WEAPON_TYPE == WEAPON_TYPES.THROWABLE
