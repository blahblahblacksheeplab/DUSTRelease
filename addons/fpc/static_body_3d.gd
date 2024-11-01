extends StaticBody3D

# Declare variables at the class level for access in multiple functions
var show_ak: int = 0
var show_knife: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Initial setup can be done here if needed
	update_weapon_visibility()

func _process(delta):
	if Input.is_action_pressed("knife"):
		show_knife = 1
		show_ak = 0  # Make sure to hide the AK when knife is selected
		print("knife_equipped")
		update_weapon_visibility()
	elif Input.is_action_pressed("ak47"):  # Assuming you have an input action for the AK
		show_ak = 1
		show_knife = 0  # Make sure to hide the knife when AK is selected
		print("ak_equipped")
		update_weapon_visibility()

func update_weapon_visibility() -> void:
	# Manage visibility based on the current selection
	var ak47 = $ak47
	var knife = $knife

	if show_ak == 1:
		if ak47:
			ak47.visible = true
		else:
			print("Node 'ak47' not found!")
	else:
		if ak47:
			ak47.visible = false

	if show_knife == 1:
		if knife:
			knife.visible = true
		else:
			print("Node 'knife' not found!")
	else:
		if knife:
			knife.visible = false
