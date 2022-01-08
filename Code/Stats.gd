extends Node
var maxHP
onready var HP = maxHP setget SetHP

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func SetHP(value):
	HP=value
	print ("HP changed")
	if HP<=  0:
		print ("NO HP Left :D")
		
func LossHP(value):

	if value<=HP:
		print ("One hit Kill !!!")
		
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
