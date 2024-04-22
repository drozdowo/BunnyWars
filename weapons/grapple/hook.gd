class_name GrappleHook extends Projectile

var maxRange: float = 900
@onready var hookSprite = $Sprite2D
@onready var hitbox: Area2D = $hitbox

@export var joint: StaticBody2D;
var ropeOrigin: Vector2;

signal hook_hit_terrain
signal hook_break

# Called when the node enters the scene tree for the first time.
func _ready():
	hitbox.body_entered.connect(_grapple_hit)
	pass # Replace with function body.

func init_hook(origin: Vector2):
	ropeOrigin = origin;
	
func _process(delta):
	if (ropeOrigin.distance_to(global_position) >= maxRange):
		print("max range");
		hook_break.emit()
		queue_free();

func _grapple_hit(node: Node):
	if (node is DestructibleTerrain):
		print("grapple hit something")
		hook_hit_terrain.emit()
		frozen = true
