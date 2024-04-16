extends ThrowableBase

@onready var fuseTimer = $FuseTimer
@onready var explosionArea = $Explosion
@onready var explosionRadius = $Explosion/ExplosionRadius

#Fuse duration in seconds
@export var fuse: float = 3;
@export var collisionFuse: float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	baseThrow = 25;
	add_to_group(Groups.THROWN_WEAPON)
	fuseTimer.start(fuse);
	fuseTimer.timeout.connect(explode)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func explode():
	for hit in explosionArea.get_overlapping_bodies():
		if hit is DestructibleTerrain:
			hit.destroyTerrainCircle(explosionRadius.global_position, explosionRadius.shape.radius)
		if hit is Bunny:
			hit.velocity += explosionRadius.global_position.direction_to(hit.global_position) * 500
			hit.takeDamage(damage)
	queue_free()
