extends KinematicBody2D
onready var PlayerHP =3  
var score = 0
const PlayerSpeed = 3
var vel = Vector2()
var Timer 
const jump =275
const grav= 9.8
const swordPreload = preload ("res://Sword.tscn")
var cooldown =0.75 

var is_onGround = true 
# Called when the node enters the scene tree for the first time. playerIput()
# warning-ignore:unused_argument
func _process(delta):
	pass 
	 
func _physics_process(_delta):

	vel.y+=grav
	if PlayerHP<1:
		print("GAMEOVER")
		queue_free()
	
 
	if Input.is_action_pressed("ui_left"):
		
		
		vel.x-= PlayerSpeed
	if Input.is_action_just_released("ui_left"):
		vel.x=0 
		# then stop the player from moving position.x =0
	if Input.is_action_pressed("ui_right"):

		vel.x+= PlayerSpeed
		
	if Input.is_action_just_released("ui_right"):
		vel.x=0 
	
	if Input.is_action_just_pressed("ui_up")  :
		print ("moving up ")
	
		vel.y-=jump
		#$Timer.wait_time= cooldown
	if Input.is_action_just_released("ui_up") :
		print ("Stoped Jumping")
		vel.y+=0
	
		#$Timer.wait_time= cooldown
	if Input.is_action_just_pressed("ui_down"):
		print ("moving down ")
		vel.y+=jump
		
	
		
	
	if Input.is_action_just_pressed("Shoot" ) or Input.is_action_just_pressed("ui_accept"):
		print ("Fire")
		var sword := swordPreload.instance()
		
		 # spawn 
		get_parent().add_child(sword)
		sword.global_position= $Position2D.global_position
		
	#vel=vel.normalized()* PlayerSpeed
	vel =move_and_slide(vel,Vector2.UP)
	
	PlayerHit()


func _on_Heart_Item_PickUp():
	print ("Item Pickup")



func PlayerHit():
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		#print("Collided with: ", collision.collider.name)
		#print (collision.collider_shape_index)
		
		if collision.collider is KinematicBody2D:
			print ("Hit the player")
			PlayerHP= PlayerHP-1
			print (PlayerHP)
	

