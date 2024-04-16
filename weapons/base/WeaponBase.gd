class_name WeaponBase extends Node2D

enum WEAPON_TYPES {
	MELEE,
	HITSCAN,
	THROWABLE,
	PROJECTILE,
	UTILITY,
	GLOBAL,
}

@export_category("Weapon Functionality")
@export var VELOCITY_METER: PackedScene;

@export_category("Weapon Info")
@export var WEAPON_NAME: String;
@export var WEAPON_TYPE: WEAPON_TYPES;
@export var WEAPON_SPRITE: CompressedTexture2D;
@export var WEAPON_SPRITE_SCALE: Vector2 = Vector2(1,1);
@export var CURSOR_OVERRIDE: CompressedTexture2D = preload("res://weapons/crosshair.png")
@onready var sprite = $Sprite;

func _ready():
	print("weapon base load")
	sb.bunny_equip_weapon.connect(equip)
	sb.bunny_fire.connect(begin_fire)
	sprite.scale = WEAPON_SPRITE_SCALE;

func equip(bunny: Bunny):
	Input.set_custom_mouse_cursor(CURSOR_OVERRIDE)
	print(bunny.bunnyName, ' equipped: ', WEAPON_NAME)

# handles the velocity meter if applicable
func begin_fire(bunny: Bunny):
	print("begin fire", WEAPON_NAME)
	if (canAdjustVelocity()):
		create_velocity_meter(bunny);
		sb.bunny_release_fire.connect(release_fire)
	else:
		fire()
	

func fire(speed: float = 1):
	print("firing: ", WEAPON_NAME)
	Input.set_custom_mouse_cursor(null)
	pass
	
func release_fire(bunny: Bunny):
	var meter = bunny.get_node("FireVelocityMeter") as FireVelocityMeter
	var speed = meter.getValue()
	meter.queue_free()
	fire(speed)
	
func create_velocity_meter(bunny: Bunny):
	var velocityMeter: FireVelocityMeter = VELOCITY_METER.instantiate()
	bunny.add_child(velocityMeter)
	velocityMeter.setPos(bunny.global_position + Vector2(75, -100))
	
func canAdjustVelocity():
	return WEAPON_TYPE == WEAPON_TYPES.PROJECTILE or WEAPON_TYPE == WEAPON_TYPES.THROWABLE
