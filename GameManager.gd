extends Node2D

class_name GameManager

@onready var bunnyObject = preload("res://Bunny/bunny.tscn")

@export var active_bunny: Bunny
@export var bunnies: Array[Bunny] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group(Groups.ROOT)
	Consts.root = self;
	var spawnPoints = get_tree().get_nodes_in_group(BunnySpawnPoint.SPAWN_POINT_GROUP)
	var count = 1
	for spawnPoint: BunnySpawnPoint in spawnPoints:
		var spawned: Bunny = bunnyObject.instantiate()
		bunnies.append(spawned)
		add_child(spawned)
		spawned.bunnyName = 'gamer' + str(count)
		count+=1
		spawned.position = spawnPoint.position
	
	activate_bunny(bunnies[0])
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func activate_bunny(bunny: Bunny):
	active_bunny = bunny
	bunny.isActive = true
