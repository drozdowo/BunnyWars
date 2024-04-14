extends Camera2D

@export var horizontalScrollBuffer: int = 50;
@export var verticalScrollBuffer: int = 50;
@export var scrollSpeed: float = 5.0;
@export var maxZoom: float = 1;
@export var minZoom: float = 0.33;
@export var zoomSpeed: Vector2 = Vector2(0.05, 0.05);

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_screen_scrolling()
	handle_zoom()
	pass

func _physics_process(delta):
	if Input.is_action_pressed("bunny_center_camera"):
		var bunnyPos = (Consts.root as GameManager).active_bunny.position
		var cameraPos = get_viewport_rect().get_center()
		position = bunnyPos

func handle_zoom():
	if Input.is_action_just_pressed("bunny_zoom_in") && zoom.x < maxZoom:
		zoom += zoomSpeed
	
	if Input.is_action_just_pressed("bunny_zoom_out") && zoom.x > minZoom:
		zoom -= zoomSpeed

func handle_screen_scrolling():
	var mousePos = get_viewport().get_mouse_position()
	var screenDimensions = get_viewport_rect().size
	var oldScreenPos = self.transform;
	
	if (mousePos.x < (0 + horizontalScrollBuffer)):
		self.transform = self.transform.translated(Vector2(-scrollSpeed, 0))
	elif (mousePos.x > (screenDimensions.x - horizontalScrollBuffer)):
		self.transform = self.transform.translated(Vector2(scrollSpeed, 0))
	
	if (mousePos.y < (0 + verticalScrollBuffer)):
		self.transform = self.transform.translated(Vector2(0, -scrollSpeed))
	elif (mousePos.y > (screenDimensions.y - verticalScrollBuffer)):
		self.transform = self.transform.translated(Vector2(0, scrollSpeed))
