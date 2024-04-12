class_name Bazooka extends Weapon

var rocket = preload("res://weapons/bazooka/rocket.tscn")

func _init():
	WEAPON_NAME = 'Bazooka'
	WEAPON_TYPE = WEAPON_TYPES.PROJECTILE
	WEAPON_SPRITE = preload("res://weapons/bazooka/bazooka.png")

func equip(mount: WeaponMount):
	print('equipped', WEAPON_NAME)

func fire(mount: WeaponMount, speed: float):
	super.fire(mount, speed)
	Projectile.instantiateAndLaunch(rocket, mount.global_position, mount.global_rotation, speed);
