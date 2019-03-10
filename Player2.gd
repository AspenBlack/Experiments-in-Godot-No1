extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const ACCEL = 1500
const MAX_Speed = 500
const Fricton = -500
var acc = Vector2()
var vel = Vector2()


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _fixed_process(delta):
	
	
	pass 
	