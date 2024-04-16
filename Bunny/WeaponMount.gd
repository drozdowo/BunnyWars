class_name WeaponMount extends Sprite2D

@onready var myBunny: Bunny = $"../"
@export var active_weapon: WeaponBase;


func equip_weapon(weapon: WeaponBase):
	if weapon != null:
		if active_weapon != null:
			clear_weapon()
		visible = true
		add_child(weapon)
		weapon.equip(myBunny)
		active_weapon = weapon as WeaponBase
		
func clear_weapon():
	visible = false;
	active_weapon.unequip(myBunny)
	remove_child(active_weapon)
	active_weapon = null;
	
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (active_weapon == null):
		return
	look_at(get_global_mouse_position())
	pass
