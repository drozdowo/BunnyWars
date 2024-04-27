extends OptionButton


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, item_count):
		if (get_item_icon(i) != null): 
			var image = get_item_icon(i).get_image();
			image.resize(64, 32);
			var scaled = ImageTexture.new().create_from_image(image);
			set_item_icon(i, scaled)
		if (PerkDescriptions.PERK_DESCRIPTIONS[get_item_text(i)] != null):
			set_item_tooltip(i, PerkDescriptions.PERK_DESCRIPTIONS[get_item_text(i)])
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
