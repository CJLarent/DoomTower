extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

	pass 



func _on_Button_pressed():
	print("pressed")
	get_tree().change_scene("res://Level Test.tscn")
	


func _on_Continue__pressed():
	
	print("pressed")
	get_tree().change_scene("res://Level Test.tscn")


func _on_Exit__pressed():
	get_tree().quit()
