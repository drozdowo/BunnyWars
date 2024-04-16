class_name GrapplingHook extends Weapon

var grapplingHookFired = preload("res://weapons/grapple/grapple_hook.tscn");

var fired: bool = false;

func equip(mount: WeaponMount):
	print("grapple equip")

func fire(mount: WeaponMount, speed: float):
	var projectile: GrappleHook = Projectile.instantiateAndLaunch(grapplingHookFired, mount.global_position, mount.global_rotation, 100)
	var rope = Line2D.new()
	mount.add_child(rope);
	rope.add_point(mount.global_position)
	rope.add_point(mount.global_position + Vector2.UP.rotated(mount.global_rotation) * 10)
	projectile.ropeOrigin = mount.global_position
	projectile.gravity = 0
