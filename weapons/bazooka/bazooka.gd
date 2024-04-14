class_name Bazooka extends Weapon

var rocket = preload("res://weapons/bazooka/rocket.tscn")

func equip(mount: WeaponMount):
	print('equipped', WEAPON_NAME)

func fire(mount: WeaponMount, speed: float):
	super.fire(mount, speed)
	var projectile: Projectile = Projectile.instantiateAndLaunch(rocket, mount.global_position, mount.global_rotation, speed);
	projectile.damage = WEAPON_DAMAGE
	self.finished_firing.emit()
	print("sha")
