extends CharacterBody3D

const SPEED = 5.0

var path = []
var current_target_index = 0
var target_character: CharacterBody3D  # Adjust as needed

func _ready():
	# Find the target character in the scene
	target_character = get_node("/root/main/Character")  # Adjust the path to your Character node

func _process(delta):
	if target_character:
		# Update the path if needed
		if path.size() == 0 or current_target_index >= path.size():
			find_path()

		# Follow the path
		follow_path(delta)

func find_path():
	if target_character:
		var start_position = global_transform.origin
		var target_position = target_character.global_transform.origin
		var navigation = get_tree().get_root().get_child(0).get_node("NavigationRegion")  # Adjust the path to your NavigationRegion

		path = navigation.get_simple_path(start_position, target_position, false)

		# Reset the target index
		current_target_index = 0

		# Remove the last point if it's too close to the target
		if path.size() > 0 and path[-1].distance_to(target_position) < 1.0:
			path.pop_back()

func follow_path(delta):
	if current_target_index >= path.size():
		return  # No more targets in the path

	var target_position = path[current_target_index]

	# Move towards the target
	var direction = (target_position - global_transform.origin).normalized()
	velocity = direction * SPEED  # Set the velocity

	move_and_slide()  # Call without parameters

	# Rotate towards the target
	look_at(target_position, Vector3.UP)

	# Check if close enough to the target to proceed to the next one
	if global_transform.origin.distance_to(target_position) < 0.5:
		current_target_index += 1  # Move to the next target
