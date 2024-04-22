extends WeaponBase

@onready var katanaHitbox: Area2D = $Hitbox;
var WEAPON_DAMAGE = 100

func fire(speed: float = 1):
	self.bunny.friction = 0.1
	self.bunny.velocity += self.bunny.position.direction_to(get_global_mouse_position()) * 1000
	(self.bunny.velocity_zero as Signal).connect(finish_firing)
	katanaHitbox.body_entered.connect(hit)
	
	
func hit(node: Node):
	if node is Bunny && node != self.bunny:
		var hitBunny: Bunny = node as Bunny;
		hitBunny.takeDamage(WEAPON_DAMAGE)
	
func finish_firing(bunny: Bunny):
	bunny.velocity_zero.disconnect(finish_firing)
	unequip(bunny)
	bunny.friction = 0.3
