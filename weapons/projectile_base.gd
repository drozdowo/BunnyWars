class_name Projectile extends Area2D

var velocity = Vector2.ZERO

@export var spriteImage: CompressedTexture2D;
@export var muzzle_velocity: float;
@export var damage: float;

# If the projectile is "frozen" ie: not moving anymore
var frozen: bool = false;

func _init():
	var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func launch(speedMultiplier: float = 1):
	velocity = Vector2(muzzle_velocity, 0).rotated(rotation) * speedMultiplier

# gravity processing
func _physics_process(delta):
	if (!frozen):
		velocity.y += gravity * delta
		position += velocity * delta
		rotation = velocity.angle()

# called by the weapon script (bazooka.gd)
# must be provided the resource (.tscn) of the projectile, as well as the position, rotation, and speed of the projetile.
# will launch the provided resource (of type Projetile) from the provided position, toward the rotation with speed.
static func instantiateAndLaunch(resource: Resource, position: Vector2, rotation: float, speed: float):
	var projectile: Projectile = resource.instantiate()
	projectile.global_position = position
	projectile.global_rotation = rotation
	Consts.root.add_child(projectile)
	projectile.launch(max(1, speed / 25))
	return projectile;

static func instantiateAndLaunchAsChild(resource: Resource, position: Vector2, rotation: float, speed: float, parent: Node):
	var projectile: Projectile = resource.instantiate()
	parent.add_child(projectile)
	projectile.global_position = position
	projectile.global_rotation = rotation
	projectile.launch(max(1, speed / 25))
	return projectile;
