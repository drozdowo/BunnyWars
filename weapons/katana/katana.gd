class_name Katana extends Weapon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fire(mount: WeaponMount, speed: float):
	super.fire(mount, speed)
	var bunny: Bunny = mount.myBunny;
	bunny.friction = 0.1
	bunny.velocity += bunny.position.direction_to(mount.get_global_mouse_position()) * 1000
	(bunny.velocity_zero as Signal).connect(done)
	(mount.meleeCollider as Area2D).body_entered.connect(hit.bind(bunny))
	
	
func hit(node: Node, myself: Bunny):
	if node is Bunny && node != myself:
		var bunny: Bunny = node as Bunny;
		bunny.takeDamage(WEAPON_DAMAGE)
	
func done(bunny: Bunny):
	self.finished_firing.emit()
	bunny.velocity_zero.disconnect(done)
	bunny.friction = 0.3
