class_name WeaponBazooka extends WeaponBase

@export_category("Bazooka")
@export var projectile: PackedScene;

func fire(speed: float = 1):
	print("bazooka fired at ", speed)
	Projectile.instantiateAndLaunch(projectile, global_position, global_rotation, speed);
