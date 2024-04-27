class_name SB extends Node

# Game Signals
signal game_ready
signal add_team(team: Team)
signal teams_spawned

# Bunny Signals
signal bunny_take_damage(bunny: Bunny, damage: float)
signal bunny_join_team(bunny: Bunny, team: Team)
signal bunny_finished_turn(bunny: Bunny)

# Weapons
var WEAPON_DICT = {
	"Bazooka": preload("res://weapons/bazooka/WeaponBazooka.tscn"),
	"Grenade": preload("res://weapons/grenade/WeaponGrenade.tscn"),
	"Katana": preload("res://weapons/katana/WeaponKatana.tscn"),
	"GrapplingHook": preload("res://weapons/grapple/WeaponGrapple.tscn"),
	"Skip": preload("res://weapons/skip/WeaponSkip.tscn")
}
