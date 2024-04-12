extends Polygon2D

@onready var collider: CollisionPolygon2D = $CollisionPolygon2D;

# Called when the node enters the scene tree for the first time.
func _ready():
	collider.polygon = polygon
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
