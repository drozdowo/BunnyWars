class_name CustomizeTeamBunnyController extends MarginContainer

@onready var rowContainer : VBoxContainer = $VBoxContainer

var customizeBunnyRows: Array[BunnyCustomizeRow] = []

func _ready():
	for row in rowContainer.get_children():
		if row is BunnyCustomizeRow:
			customizeBunnyRows.append(row)
