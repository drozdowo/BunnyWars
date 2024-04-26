extends WeaponBase

@export var grapplingHookProjectile: PackedScene;
@export var ropeColor: Color = Color.SADDLE_BROWN
var rope: Line2D;
var hook: GrappleHook;

# hook variables
@export var maxRopeLength = 800;
@export var ropeTaughtness = 100;
var ropeLength = null;

func unequip(bunny: Bunny):
	super.unequip(bunny)
	clear_hook(bunny);

func _physics_process(delta):
	if (rope && hook):
		rope.set_point_position(0, global_position);
		rope.set_point_position(1, hook.global_position);
		if (ropeLength):
			process_hook()

func clear_hook(bunny: Bunny):
	print("clear hook?");
	if (rope): rope.queue_free();
	if (hook): hook.queue_free();
	rope = null;
	hook = null;
	ropeLength = null;
	bunny.finish_overriding_movement.emit()

func hook_connect():
	ropeLength = bunny.global_position.distance_to(hook.global_position)
	configure_hook()
	#bunny.overriding_movement.emit()

func configure_hook():
	bunny.overriding_movement.emit()
	print("Rope Length:", ropeLength)
	pass
	
func process_hook():
	# directionPull < 0 = too close, directionPull > 0 too far
	var directionPull = (bunny.global_position.distance_to(hook.global_position) / ropeLength) - 1
	var hookVector:Vector2 = (bunny.global_position.direction_to(hook.global_position) * ropeTaughtness) * directionPull
	if directionPull < 0.2 and directionPull > -0.2: # too far
		hookVector *= 0
	elif directionPull < -0.2:
		hookVector *= -1
	bunny.apply_force(hookVector * 80)
	if (ropeLength): # it hit something
		if Input.is_action_pressed("bunny_move_up") && ropeLength > 30: #shorten grapple
			print("shorten:", ropeLength)
			ropeLength -= 5
		if Input.is_action_pressed("bunny_move_down") && ropeLength <= hook.maxRange: #lengthen grapple
			print("lengthen:", ropeLength)
			ropeLength += 5
	pass

func fire(speed: float = 1):
	if (hook): clear_hook(bunny);
	rope = Line2D.new()
	rope.default_color = ropeColor
	hook = Projectile.instantiateAndLaunch(grapplingHookProjectile, global_position, global_rotation, 175)
	hook.maxRange = maxRopeLength
	Consts.root.add_child(rope)
	hook.gravity = 0
	hook.init_hook(global_position)
	rope.add_point(Vector2.ZERO)
	rope.add_point(Vector2.ZERO)
	sb.bunny_release_fire.connect(clear_hook)
	hook.hook_break.connect(clear_hook.bind(bunny))
	hook.hook_hit_terrain.connect(hook_connect)
	print("connect clear hook")
	pass
