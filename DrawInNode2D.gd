extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ArrayOf2D = PoolVector2Array()
var ArrayOf2D_2 = PoolVector2Array([Vector2(0,0),Vector2(10,10),Vector2(20,20),Vector2(30,30)])

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	#draw_line(Vector2(0,0),Vector2(0.1,0.1),Color(255,0,0),1)
	
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
 
func _draw():
	draw_polyline(ArrayOf2D,Color(255,0,0),2)
	draw_polyline(ArrayOf2D_2,Color(255,100,0),1)
	pass
	
func _input(event):
	if event is InputEventMouseMotion:
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			print("Mouse Motion at:",event.position)
			print("Mouse Relitive at:",event.relative)
			print("Mouse Speed at:",event.speed)
			print("Array size :",ArrayOf2D.size())
			ArrayOf2D.append(event.position)
			update()

	if event is InputEventMouseButton:
		if (event.button_index == BUTTON_LEFT and not event.is_pressed()):
			ArrayOf2D_2 = ArrayOf2D
			ArrayOf2D = PoolVector2Array()
			#ArrayOf2D = ArrayOf2D.remove(-1)
#			for i in range(ArrayOf2D.size()):
#				#ArrayOf2D = ArrayOf2D.remove(0)
#				print("Array size :",ArrayOf2D.size())
			
