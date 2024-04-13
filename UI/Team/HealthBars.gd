class_name HealthBars extends Container

signal Bunny_Health_Changed

var bunnies: Array[Bunny];
var healthBars: Array[ProgressBar]

func _init(bunnies: Array[Bunny]):
	self.bunnies = bunnies


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func generateHealthBars():
	print("generate health bars")

func createHealthBar():
	var healthBar = ProgressBar.new()
	healthBar.add_theme_color_override('Background', Color.TRANSPARENT)
	healthBar.add_theme_color_override('Fill',Color.RED)
