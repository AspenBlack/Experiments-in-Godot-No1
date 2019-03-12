extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var countdown = 0.0 
var Bullet_Scene = load("res://Subscene/Bullet_I_.tscn")
var Bullet_Script = load("res://Subscene/Bullet_I_.gd")
var thenodes

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	add_to_group("BlueBots")
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	countdown = countdown-delta
	if (countdown < 0):
		countdown = 1
		
		
		shoot(get_closest_target().global_position)	
		move()
		
#		print("***Top***")
#		#print_tree_pretty()
#		var index = get_child_count()
#		var TheNode = get_child(index-1)
#
#		print(get_parent())
#		get_parent().print_tree_pretty()
#		print(get_groups())
#		var thenodes = get_tree().get_nodes_in_group("BlueBots")
#		for i in thenodes:
#			print(i.name)
#		thenodes = get_tree().get_nodes_in_group("FreeFire")
#		for i in thenodes:
#			print(i.name)
#		print("Closest Target:")
#		print(get_closest_target().name)
#		print("end")
	pass
	
	
func get_closest_target():
	var SomeNodes = get_tree().get_nodes_in_group("RedBots")
	var ANode = SomeNodes[0]
	for i in SomeNodes:
	#	print(i.name)
	#	print(i.global_position)
	#	print(position.distance_to(i.global_position))
		if position.distance_to(ANode.global_position) > position.distance_to(i.global_position):
			ANode = i
	return ANode
	pass



func shoot( Apoint ):
	#if (Apoint.get_class() != "Vector2") : #only works for objects vector2 is a built in type.
	if (typeof(Apoint) != TYPE_VECTOR2):  #can test any thing but then need to test what type of object
		print ("type Error")
		return null
	var AnAngle = position.angle_to_point(Apoint)
	
	var NewPoint = Apoint - position
	print ("Tartet Point %s" % Apoint)
	print ("Angle to TartetAnAngle %s" % (AnAngle*57.29))
	print ("Current Point %s" % position)
	print ("Vector from current to Target %s" % NewPoint)
	var bullet = Bullet_Scene.instance()
	NewPoint = NewPoint.normalized()
	print ("Vector from current to Target Normalised %s" % NewPoint)
	NewPoint = NewPoint*50
	bullet.set_name("bullet_A")
	bullet.set_script(Bullet_Script)
	bullet.position += NewPoint
	AnAngle = 270 + (AnAngle * 57.29) #dont get the factor wrong :)
	print ("Angle loaded %s" % (AnAngle))
	bullet.rotation_degrees = AnAngle
	#bullet.position.y += 10
	add_child(bullet)
	
	pass


func move():
	var Amove = Vector2(10,0)
	move_and_collide(Amove)
	
	pass
	
	

