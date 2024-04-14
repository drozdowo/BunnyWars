class_name Katana extends Weapon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fire(mount: WeaponMount, speed: float):
	super.fire(mount, speed)
	var bunny: Bunny = mount.myBunny;
	bunny.velocity += bunny.position.direction_to(mount.get_global_mouse_position()) * 1000
	(bunny.velocity_zero as Signal).connect(done)
	
func done(bunny: Bunny):
	self.finished_firing.emit()
	bunny.velocity_zero.disconnect(done)
