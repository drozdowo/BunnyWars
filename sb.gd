class_name SB extends Node

# Game Signals
signal add_team(team: Team)

# Bunny Signals
signal bunny_take_damage(bunny: Bunny, damage: float)

# Bunny Weapon Functionality Signals
signal bunny_equip_weapon(bunny: Bunny, weapon: WeaponBase)
signal bunny_fire(bunny: Bunny)
signal bunny_release_fire(bunny: Bunny)
