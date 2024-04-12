class_name BazookaProjectile extends Projectile

@onready var rocket: Area2D = $Rocket
@onready var rocketHitbox: CollisionShape2D = $Rocket/Hitbox
@onready var explosionRadius: CollisionShape2D = $ExplosionRadius
var explosionDamage = 50

func _init():
	spriteImage = preload("res://weapons/bazooka/rocket.png")
	muzzle_velocity = 500
	directHitDamage = 75

func _ready():
	rocket.body_entered.connect(on_collide)

func on_collide(body):
	if (body.is_in_group(Groups.TERRAIN_GROUP)):
		# check all overlapping bodies that the collider should interact with
		for hit in get_overlapping_bodies():
			print(hit)
			var pos = explosionRadius.global_position
			var radius = (explosionRadius.shape as CircleShape2D)
			if hit is DestructibleTerrain:
				(hit as DestructibleTerrain).destroyTerrainCircle(pos, radius.radius)
			if hit is Bunny:
				hit.velocity += explosionRadius.global_position.direction_to(hit.global_position) * 750
				hit.takeDamage(explosionDamage)
			queue_free()
	pass
