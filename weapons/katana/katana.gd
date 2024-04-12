class_name Katana extends Weapon

# Called when the node enters the scene tree for the first time.
func _init():
	WEAPON_NAME = 'Katana'
	WEAPON_TYPE = WEAPON_TYPES.MELEE
	WEAPON_SPRITE = preload("res://weapons/katana/katana.png")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
