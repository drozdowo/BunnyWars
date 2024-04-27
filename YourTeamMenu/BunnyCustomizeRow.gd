class_name BunnyCustomizeRow extends MarginContainer

@onready var bunnyName: LineEdit = $HBoxContainer/TextEdit
@onready var bunnyWeapon1: OptionButton = $HBoxContainer/Weapon1/OptionButton
@onready var bunnyWeapon2: OptionButton = $HBoxContainer/Weapon2/OptionButton
@onready var bunnyPerk: OptionButton = $HBoxContainer/Perk/OptionButton

var was_changed: bool = false;
var bunnyData: BunnyData = BunnyData.new()

func _ready():
	bunnyName.text_changed.connect(change_name)
	bunnyWeapon1.item_selected.connect(change_weapon.bind(0))
	bunnyWeapon2.item_selected.connect(change_weapon.bind(1))
	bunnyPerk.item_selected.connect(change_perk)
	
func change_name(change: String):
	was_changed = true;
	bunnyData.bunnyName = change;
	
func change_weapon(itemIdx: int, weaponIdx: int):
	var weaponName = bunnyWeapon1.get_item_text(itemIdx);
	was_changed = true;
	bunnyData.weapons[weaponIdx] = weaponName

func change_perk(change: String):
	was_changed = true;
	print("CHANGED PERK")
	
func get_weapon_idx_from_name(weaponName: String):
	for i in range(0, bunnyWeapon1.item_count):
		if (bunnyWeapon1.get_item_text(i) == weaponName):
			return i
	
func is_valid():
	return len(bunnyData.bunnyName) > 0 && len(bunnyData.weapons) == 2
