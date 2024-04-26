class_name StateMachine extends Node

signal transitioned(state_name: String)

@export var initial_state := NodePath()

@onready var state: State = get_node(initial_state)

func _ready() -> void:
	await owner.ready
	if (not Consts.root.is_node_ready()):
		await Consts.root.ready
	for child in get_children():
		child.state_machine = self
	state.enter()

func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)
	
func _process(delta: float) -> void:
	state.update(delta)

func _physics_process(delta: float) -> void:
	state.physics_update(delta)

func transition_to(target_state: String, msg: Dictionary = {}) -> void:
	if not has_node(target_state):
		print("invalid state:", target_state)
		return
	state.exit()
	state = get_node(target_state)
	state.enter(msg)
	transitioned.emit(state.name)
