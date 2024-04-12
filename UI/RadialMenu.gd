extends Node

@export var menu_items = []
@onready var control = $Control
@onready var gameManager: GameManager = $"../"

var menuPos = null

func create_menu_items():
	var menu_items: Array[Weapon] = gameManager.active_bunny.inventory
	var buttons: Array[Button] = []
	var num_items = menu_items.size()
	var angle_increment = 2 * PI / num_items
	
	for i in range(num_items):
		var button = Button.new()
		button.text = menu_items[i].WEAPON_NAME
		button.set_position(Vector2(100, 0).rotated(i * angle_increment))
		#button.set_rotation(i * angle_increment)
		button.button_down.connect(equip_weapon.bind(menu_items[i]))
		$Control.add_child(button)
		buttons.append(button)

func _ready():
	hide_menu()

func show_menu():
	$Control.visible = true

func hide_menu():
	$Control.visible = false

func equip_weapon(weapon: Weapon):
	gameManager.active_bunny.equip_weapon(weapon)

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		if $Control.visible == false:
			create_menu_items()
		control.set_global_position(Vector2(gameManager.active_bunny.global_position.x - 30, gameManager.active_bunny.global_position.y))
		show_menu()
	else:
		hide_menu()
