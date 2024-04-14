class_name Projectile extends Area2D

var velocity = Vector2.ZERO

@export var spriteImage: CompressedTexture2D;
@export var muzzle_velocity: float;
@export var damage: float;

func _init():
	var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func launch(speedMultiplier: float = 1):
	velocity = Vector2(muzzle_velocity, 0).rotated(rotation) * speedMultiplier

# gravity processing
func _physics_process(delta):
	velocity.y += gravity * delta
	position += velocity * delta
	rotation = velocity.angle()

# called by the weapon script (bazooka.gd)
# must be provided the resource (.tscn) of the projectile, as well as the position, rotation, and speed of the projetile.
# will launch the provided resource (of type Projetile) from the provided position, toward the rotation with speed.
static func instantiateAndLaunch(resource: Resource, position: Vector2, rotation: float, speed: float):
	var projectile: Projectile = resource.instantiate()
	projectile.position = position
	projectile.rotation = rotation
	Consts.root.add_child(projectile)
	projectile.launch(max(1, speed / 25))
	return projectile;
