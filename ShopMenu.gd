extends VBoxContainer
var MAINMENU = preload("res://main_menu.tscn")

func _on_button_4_pressed():
	if is_instance_valid(MAINMENU):
		print("Valid")
	else:
		print("Not valid")
	get_tree().change_scene_to_file("res://main_menu.tscn")
