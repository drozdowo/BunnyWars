class_name Projectile extends Area2D

var velocity = Vector2.ZERO

@export var spriteImage: CompressedTexture2D;
@export var muzzle_velocity: float;
@export var directHitDamage: float;
var isLaunched = false;

func _init():
	var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func launch(speedMultiplier: float = 1):
	velocity = Vector2(muzzle_velocity, 0).rotated(rotation) * speedMultiplier

func _physics_process(delta):
	velocity.y += gravity * delta
	position += velocity * delta
	rotation = velocity.angle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
static func instantiateAndLaunch(resource: Resource, position: Vector2, rotation: float, speed: float):
	var projectile: Projectile = resource.instantiate()
	projectile.position = position
	projectile.rotation = rotation
	Consts.root.add_child(projectile)
	projectile.launch(max(1, speed / 25))
