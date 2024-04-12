class_name DestructibleTerrain extends StaticBody2D

@onready var polygon: Polygon2D = $terrain
@export var innerTexture: CompressedTexture2D;
@export var outerTexture: CompressedTexture2D;
@export var outerTextureWidth: int;

var myCollider: CollisionPolygon2D

func _init():
	add_to_group(Groups.TERRAIN_GROUP)

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("terrain")
	myCollider = CollisionPolygon2D.new()
	add_child(myCollider)
	myCollider.name = "terrain"
	myCollider.polygon = polygon.polygon
	myCollider.transform = polygon.transform
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func destroyTerrainCircle(collisionPos: Vector2, radius: float):
	var explosionCircle = generate_circle_polygon(radius, 32)
	var explosionPoly = Transform2D(0, polygon.to_local(collisionPos)) * explosionCircle;
	var clipResult = Geometry2D.clip_polygons(polygon.polygon, explosionPoly)
	#var newPoly = Polygon2D.new()
	#newPoly.polygon = explosionPoly;
	#add_child(newPoly);
	polygon.polygon = clipResult[0]
	myCollider.polygon = clipResult[0]

func generate_circle_polygon(radius, points):
	var polygon = PackedVector2Array()
	for i in range(points):
		var angle = i * 2.0 * PI / points
		var point = Vector2(cos(angle), sin(angle)) * radius
		polygon.append(point)
	return polygon
