extends KinematicBody2D
const Monster_Speed =45
const grav =9.8
var vel = Vector2()
var right= true 

onready var HP=1 
signal MonsterSpwaned 
signal MonsterDead 
 
# Called when the node enters the scene tree for the first time.
func _ready():
	
	emit_signal("MonsterSpwaned")

func _physics_process(_delta):
	Move_Monster()
	collision_layer =1
	if HP<=0:
		emit_signal("MonsterDead")
	
	
func Move_Monster():
	
	vel.y+= grav
	vel.x+= Monster_Speed  if right else -Monster_Speed
	if $RayCast2D.is_colliding(): 
		right = !right 
		scale.x =- scale.x
	vel=vel.normalized()* Monster_Speed
	vel= move_and_slide(vel,Vector2.UP)
	MonsterHit() 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Monster_MonsterDead():
	print ("Dead")
	queue_free()


func _on_Monster_MonsterSpwaned():
	print ("KILL")


func MonsterHit():
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		#print("Collided with: ", collision.collider.name)
		#print (collision.collider_shape_index)
		
		if collision.collider is KinematicBody2D:
			print ("Hit the player")
			HP= HP-1
			print (HP)

