class_name GrappleHook extends Projectile

var maxRange: float = 900
@onready var hookSprite = $Sprite2D
@onready var rope = $Rope
@onready var hitbox: Area2D = $hitbox
@onready var ropeBase: Area2D = $RopeBase
var ropeOrigin: Vector2;

# Called when the node enters the scene tree for the first time.
func _ready():
	hitbox.body_entered.connect(_grapple_hit)
	rope.add_point(Vector2.ZERO)
	rope.add_point(Vector2.ZERO)
	pass # Replace with function body.
	
func _process(delta):
	rope.set_point_position(0, ropeOrigin)
	rope.set_point_position(1, ropeBase.global_position)
	if (ropeOrigin.distance_to(global_position) >= maxRange):
		print("max range");
		queue_free();

func _grapple_hit(node: Node):
	if (node is DestructibleTerrain):
		print("grapple hit something")
		queue_free()
