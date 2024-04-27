class_name TeamDisplay extends GridContainer

@onready var teamName: Label = $TeamName
@onready var teamHealth: ProgressBar = $HealthBar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_max_health(val: float):
	teamHealth.max_value = val;
