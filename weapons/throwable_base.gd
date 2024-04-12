class_name ThrowableBase extends RigidBody2D

signal throw_weapon;

@export var baseThrow: float;

static func instantiateAndThrow(resource: Resource, position: Vector2, rotation: float, speed: float):
	var thrownWeapon: ThrowableBase = resource.instantiate()
	(Consts.root as Node2D).add_child(thrownWeapon)
	(thrownWeapon as RigidBody2D).global_rotation = rotation
	(thrownWeapon as RigidBody2D).global_position = position
	(thrownWeapon as RigidBody2D).linear_velocity = Vector2(thrownWeapon.baseThrow, 0).rotated(rotation) * speed
