class_name WeaponMount extends Sprite2D

@onready var myBunny: Bunny = $"../"
@export var activeWeapon: Weapon = null

var isFiring: bool = false;
var cursor = preload("res://weapons/crosshair.png")
var velocityMeter = preload("res://weapons/FireVelocityMeter.tscn")

func _input(event):
	if activeWeapon != null && Input.is_action_just_pressed("bunny_click"):
		if !isFiring && activeWeapon.canAdjustVelocity():
			createVelocityMeter()
			isFiring = true;
		elif !isFiring:
			fireWeapon()
	if (activeWeapon != null && isFiring && Input.is_action_just_released("bunny_click")):
		fireWeapon()

func equipWeapon(weapon: Weapon):
	if weapon != null:
		visible = true
		activeWeapon = weapon as Weapon
		texture = weapon.WEAPON_SPRITE
		activeWeapon.equip(self)
		Input.set_custom_mouse_cursor(cursor)

func fireWeapon():
	activeWeapon.finished_firing.connect(finishedFiring);
	if activeWeapon != null:
		if isFiring && activeWeapon.canAdjustVelocity():
			var speed = finishVelocityMeter()
			activeWeapon.fire(self, speed)
		else:
			activeWeapon.fire(self, 1)
	
func finishedFiring():
	isFiring = false;
	visible = false;
	activeWeapon = null
	Input.set_custom_mouse_cursor(null)
	
func createVelocityMeter():
	# create and start meter
	var velocityMeter: FireVelocityMeter = velocityMeter.instantiate()
	myBunny.add_child(velocityMeter)
	velocityMeter.setPos(myBunny.global_position + Vector2(75, -100))

func finishVelocityMeter():
	var velocityMeter: FireVelocityMeter = $"../FireVelocityMeter"
	var fireValue = velocityMeter.getValue()
	velocityMeter.queue_free()
	return fireValue
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (activeWeapon == null):
		return
	look_at(get_global_mouse_position())
	pass
