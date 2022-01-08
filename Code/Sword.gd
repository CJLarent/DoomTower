 
extends KinematicBody2D
var SPEED: float =175
var currentPos = Vector2()
var vel= Vector2 ()
var damgeValue = 1 
var lifetime= 3 



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	var hit= move_and_collide(vel* delta)
	position.x+= SPEED* delta 
	if hit !=null:
		queue_free()
	

