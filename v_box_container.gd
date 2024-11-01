extends VBoxContainer
const MAIN = preload("res://main.tscn")
const SHOP = preload("res://shop.tscn")
const MAINMENU = preload("res://main_menu.tscn")
func _on_button_pressed():
	get_tree().change_scene_to_packed(MAIN)


func _on_button_3_pressed() -> void:
	get_tree().quit()


func _on_shop_pressed() -> void:
	get_tree().change_scene_to_packed(SHOP)
func _on_button_4_pressed():
	get_tree().change_scene_to_packed(MAINMENU)
