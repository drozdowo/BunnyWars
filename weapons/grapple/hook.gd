class_name GrappleHook extends Projectile

var maxRange: float = 900
@onready var hookSprite = $Sprite2D
@onready var rope = $Rope
@onready var hitbox: Area2D = $hitbox
@onready var ropeBase: Area2D = $RopeBase

var origin: Vector2;

# Called when the node enters the scene tree for the first time.
func _ready():
	hitbox.body_entered.connect(_grapple_hit)
	pass # Replace with function body.
	
func setRope(pos: Vector2):
	rope.add_point(pos,0)
	
func _process(delta):
	rope.add_point(ropeBase.global_position, 1)
	if (origin.distance_to(global_position) >= maxRange):
		print("max range");
		queue_free();

func _grapple_hit(node: Node):
	if (node is DestructibleTerrain):
		print("grapple hit something")
		queue_free()
