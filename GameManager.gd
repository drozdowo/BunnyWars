extends Node2D

class_name GameManager

@onready var bunnyObject = preload("res://Bunny/bunny.tscn")
@export var active_bunny: Bunny
@export var bunnies: Array[Bunny] = []
@export var deathYPos: float = 1000;
var spawnPoints;

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group(Groups.ROOT)
	Consts.root = self;
	spawnPoints = get_tree().get_nodes_in_group(BunnySpawnPoint.SPAWN_POINT_GROUP)
	startGame()
	pass # Replace with function body.
	
func startGame():
	print("start game")
	var count = 1
	for spawnPoint: BunnySpawnPoint in spawnPoints:
		var spawned: Bunny = bunnyObject.instantiate()
		spawned.initBunny(spawned, 'name', ["Bazooka", "Grenade"])
		bunnies.append(spawned)
		add_child(spawned)
		spawned.bunnyName = 'gamer' + str(count)
		count+=1
		spawned.position = spawnPoint.position
	sb.add_team.emit(Team.new("test", Color.RED, 1, bunnies))
	activate_bunny(bunnies[0])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for bunny: Bunny in bunnies:
		if bunny.global_position.y >= deathYPos:
			bunny.takeDamage(10000)
	pass

func activate_bunny(bunny: Bunny):
	active_bunny = bunny
	bunny.isActive = true
