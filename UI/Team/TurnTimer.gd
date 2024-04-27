extends ColorRect

@onready var turnTimer: Timer = $Timer
@onready var turnLabel: Label = $TurnTimer

var baseTurnTimer: int = 30;

# Called when the node enters the scene tree for the first time.
func _ready():
	sb.bunny_start_turn.connect(start_turn)
	pass # Replace with function body.

func _physics_process(delta):
	turnLabel.text = str(floor(turnTimer.time_left))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func start_turn(bunny: Bunny):
	turnTimer.start(baseTurnTimer)
	turnTimer.timeout.connect(turn_done)

func turn_done():
	sb.bunny_finished_turn.emit()
