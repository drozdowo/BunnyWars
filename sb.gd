class_name SB extends Node

# Game Signals
signal add_team(team: Team)

# Bunny Signals
signal bunny_take_damage(bunny: Bunny, damage: float)

# Bunny Weapon Functionality Signals
#signal bunny_equip_weapon(bunny: Bunny, weapon: WeaponBase)
signal bunny_fire(bunny: Bunny)
signal bunny_release_fire(bunny: Bunny)
signal bunny_show_radial(bunny: Bunny)
signal bunny_hide_radial(bunny: Bunny)
signal bunny_equip_weapon(weapon: WeaponBase)
signal bunny_unequip_weapon(weapon: WeaponBase)

# Weapons
var WEAPON_DICT = {
	"Bazooka": preload("res://weapons/bazooka/WeaponBazooka.tscn"),
	"Grenade": preload("res://weapons/grenade/WeaponGrenade.tscn")
}
