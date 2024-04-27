extends Control

@onready var gameButton: TextureButton = $MenuContainer/GridContainer/JoinGame
@onready var yourTeamButton: TextureButton = $MenuContainer/GridContainer/CustomizeBunnies

# Called when the node enters the scene tree for the first time.
func _ready():
	yourTeamButton.button_down.connect(go_to_menu.bind("YourTeam"))
	pass # Replace with function body.

func go_to_menu(menuName: String):
	print("hello?? ", menuName)
	if menuName == "YourTeam": get_tree().change_scene_to_file("res://YourTeamMenu/YourTeamMenu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
