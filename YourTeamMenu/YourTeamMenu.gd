extends Node2D

@onready var backButton: Button = $CanvasLayer/VBoxContainer/TopBar/Top/Button
@onready var teamNameEdit: LineEdit = $CanvasLayer/VBoxContainer/TeamBar/HBoxContainer/TextEdit
@onready var teamColorEdit: ColorPickerButton = $CanvasLayer/VBoxContainer/TeamBar/HBoxContainer/ColorPickerButton
@onready var bunnyBarController: CustomizeTeamBunnyController = $CanvasLayer/VBoxContainer/BunnyBar
@onready var saveButton: Button = $CanvasLayer/VBoxContainer/BottomBar/SaveTeam

const SAVE_DEST = "res://team.save"

func _ready():
	saveButton.button_down.connect(save_bunnies)
	backButton.button_down.connect(back_to_menu)
	if (FileAccess.file_exists(SAVE_DEST)):
		# save exists:
		var save = FileAccess.open(SAVE_DEST, FileAccess.READ)
		var data = JSON.parse_string(save.get_as_text())
		load_team(data);

func back_to_menu():
	get_tree().change_scene_to_file("res://MainMenu/mainmenu.tscn")
	
func load_team(data):
	teamNameEdit.text = data["teamName"]
	teamColorEdit.color = Color(data["teamColor"]["r"],data["teamColor"]["g"],data["teamColor"]["b"])
	var cur = 0
	for row: BunnyCustomizeRow in bunnyBarController.customizeBunnyRows:
		var bunnyData: BunnyData = BunnyData.from_json(data["bunnies"][cur])
		row.bunnyName.text = bunnyData.bunnyName
		row.bunnyData = bunnyData;
		row.bunnyWeapon1.select(row.get_weapon_idx_from_name(bunnyData.weapons[0]))
		row.bunnyWeapon2.select(row.get_weapon_idx_from_name(bunnyData.weapons[1]))
		cur += 1
	
func save_bunnies():
	var bunnyCount = 0
	var saveData = {
		"teamName": teamNameEdit.text,
		"teamColor": {
			"r": teamColorEdit.color.r,
			"g": teamColorEdit.color.g,
			"b": teamColorEdit.color.b
		},
		"bunnies": []
	}
	for row: BunnyCustomizeRow in bunnyBarController.customizeBunnyRows:
		if (!row.is_valid()):
			saveData["bunnies"] = []
			print("invalid save ", row.bunnyData.bunnyName, row.bunnyData.weapons)
			return;
		var bunny = row.bunnyData
		saveData["bunnies"].append(row.bunnyData.as_dict())
		bunnyCount += 1
	var saveFile = FileAccess.open("res://team.save", FileAccess.WRITE)
	saveFile.store_line(JSON.stringify(saveData))
	saveFile.close()
	print("saved?")
