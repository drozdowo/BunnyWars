class_name Bunny extends CharacterBody2D

var SPEED = 300.0
var JUMP_VELOCITY = -500.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var _sprite = $AnimatedSprite2D
@onready var overheadLabel = $BunnyOverhead/Name
@onready var overheadHealth = $BunnyOverhead/Health
@onready var camera: Camera2D = get_viewport().get_camera_2d()
@onready var weaponMount: WeaponMount = $WeaponMount
@onready var collider: CollisionShape2D = $Collider

signal take_damage(newHealth: float)
signal velocity_zero(bunny: Bunny)

var bunnyName = ''
var team: int;
var turnOrder = 0
var health = 100
var isActive: bool = false
var inventory: Array[Weapon] = []
var friction: float = 0.3

func _draw():
	overheadLabel.text = bunnyName
	overheadHealth.value = 100;

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.x = lerp(velocity.x,0.0,friction);
		
	move_and_slide()
	
	# if we have something listening for our velocity to zero out, dont let the player move
	if (velocity_zero.get_connections().size() > 0):
		if velocity.abs().x <= 0.2 && velocity.abs().y <= 0.2:
			velocity_zero.emit(self) 
	else:
		handle_controls()
	
func equip_weapon(weapon: Weapon):
	if (inventory.has(weapon)):
		weaponMount.visible = true
		weaponMount.equipWeapon(weapon)
	
func takeDamage(damage: float):
	health -= damage;
	overheadHealth.value = health
	take_damage.emit(health)
	if health <= 0:
		(Consts.root as GameManager).bunnies.erase(self)
		queue_free()
	
func handle_controls():
	if isActive == false:
		return 
		
	if Input.is_action_just_pressed("bunny_move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("bunny_move_left", "bunny_move_right")

	if direction && is_on_floor():
		velocity.x = direction * SPEED
		if direction == -1:
			_sprite.flip_h = true
		else:
			_sprite.flip_h = false

func initBunny(bunny: Bunny, name: String, weapons: Array[Weapon.WEAPONS]):
	bunny.bunnyName = name
	for weapon: Weapon.WEAPONS in weapons:
		var wepInst = load(Weapon.WeaponsDict[weapon])
		bunny.inventory.append(wepInst)
