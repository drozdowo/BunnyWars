extends WeaponBase

@export var grapplingHookProjectile: PackedScene;
@export var ropeColor: Color = Color.SADDLE_BROWN
var rope: Line2D;
var hook: GrappleHook;
var grappleLength: float;
var joint: DampedSpringJoint2D;

func unequip(bunny: Bunny):
	super.unequip(bunny)
	clear_hook();

func _physics_process(delta):
	if (rope && hook):
		rope.set_point_position(0, global_position);
		rope.set_point_position(1, hook.global_position);
		if (joint):
			joint.rotation = joint.global_position.angle_to(hook.global_position)
		if (grappleLength): # it hit something
			joint.length = grappleLength
			joint.rest_length = grappleLength
			if Input.is_action_pressed("bunny_move_up") && grappleLength > 10: #shorten grapple
				print("shorten:", grappleLength)
				grappleLength -= 5
			if Input.is_action_pressed("bunny_move_down") && grappleLength <= hook.maxRange: #lengthen grapple
				print("lengthen:", grappleLength)
				grappleLength += 5
		
func clear_hook():
	if (rope): rope.queue_free();
	if (hook): hook.queue_free();
	hook = null;
	rope = null;
	bunny.finish_overriding_movement.emit()

func hook_connect():
	print("i hit terrain??")
	grappleLength = bunny.global_position.distance_to(hook.global_position)
	configure_hook()
	bunny.overriding_movement.emit()

func configure_hook():
	var newJoint = DampedSpringJoint2D.new();
	newJoint.damping = 0.1;
	newJoint.stiffness = 10;
	newJoint.bias = 0.9
	Consts.root.add_child(newJoint)
	newJoint.node_a = bunny.get_path()
	newJoint.node_b = hook.joint.get_path()
	joint = newJoint

func fire(speed: float = 1):
	if (hook): clear_hook();
	rope = Line2D.new()
	rope.default_color = ropeColor
	hook = Projectile.instantiateAndLaunch(grapplingHookProjectile, global_position, global_rotation, 175)
	Consts.root.add_child(rope)
	hook.gravity = 0
	hook.hook_break.connect(clear_hook)
	hook.hook_hit_terrain.connect(hook_connect)
	hook.init_hook(global_position)
	rope.add_point(Vector2.ZERO)
	rope.add_point(Vector2.ZERO)
	pass
