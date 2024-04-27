class_name TeamData extends Resource

@export var teamName: String;
@export var teamColor: Color;
@export var teamBunnies: Array[BunnyData];

static func from_json(json):
	var data = TeamData.new();
	data.teamName = json["teamName"]
	data.teamColor = Color(data["teamColor"]["r"],data["teamColor"]["g"],data["teamColor"]["b"])
	for i in range(0, len(json["bunnies"])):
		data.teamBunnies.append(BunnyData.from_json(json["bunnies"][i]))
	return data;
