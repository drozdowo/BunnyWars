class_name RadialMenu extends Node

@onready var control = $Control
@onready var bunny: Bunny = $"../"

var menu_items = []
var buttons = []

signal show_radial
signal hide_radial

func create_menu_items():
	var menu_items: Array[WeaponBase] = bunny.inventory;
	var num_items = menu_items.size()
	var angle_increment = 2 * PI / num_items
	
	for i in range(num_items):
		var button = Button.new()
		button.text = menu_items[i].WEAPON_NAME
		button.set_position(Vector2(100, 0).rotated(i * angle_increment))
		button.button_down.connect(equip_weapon.bind(menu_items[i]))
		$Control.add_child(button)
		buttons.append(button)
	show_menu()

func _ready():
	show_radial.connect(create_menu_items)
	hide_radial.connect(hide_menu)
	hide_menu()

func show_menu():
	$Control.visible = true

func hide_menu():
	# get what weapon mouse is hovering
	for button: Button in buttons:
		if button.is_hovered():
			print(button.text, 'is hovered!')
			button.button_down.emit()
		$Control.remove_child(button);
	$Control.visible = false
	buttons = []
	menu_items = []

func equip_weapon(weapon: WeaponBase):
	bunny.bunny_equip_weapon.emit(weapon)

func _process(delta):
	if ($Control.visible == true):
		control.set_global_position(Vector2(bunny.position.x - 30, bunny.position.y))
	else:
		hide_menu()
