class_name GrapplingHook extends Weapon

var grapplingHookFired = preload("res://weapons/grapple/grapple_hook.tscn");

var fired: bool = false;

func _process():
	print("asD")

func equip(mount: WeaponMount):
	print("grapple equip")

func fire(mount: WeaponMount, speed: float):
	super.fire(mount, speed);
	var projectile: GrappleHook = Projectile.instantiateAndLaunch(grapplingHookFired, mount.global_position, mount.global_rotation, 100)
	projectile.setRope(mount.global_position);
	projectile.gravity = 0
