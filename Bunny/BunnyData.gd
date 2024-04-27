class_name BunnyData extends Resource

var bunnyName: String;
var weapons: Array[String];

func as_string():
	return "Name: %s | Weapons: %s" % [bunnyName, weapons]
	
func as_dict():
	return {
		"bunny_name": bunnyName,
		"bunny_weapons": weapons
	};

static func from_json(json: Dictionary):
	var data = BunnyData.new()
	data.bunnyName = json["bunny_name"]
	data.weapons.insert(0, json["bunny_weapons"][0]);
	data.weapons.insert(1, json["bunny_weapons"][1]);
	return data;
