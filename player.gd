extends KinematicBody2D

const ACCEL = 10000
const MAX_SPEED = 10000
const FRICTION = -100
const GRAVITY = 2000

var acc = Vector2()
var vel = Vector2()

func _ready():
#	set_fixed_process(true)
	set_physics_process(true)
#	set_process(true)
	
	pass


func _physics_process(delta):
	acc.y = GRAVITY
	acc.x = 0
	#acc.x = Input.is_action_pressed("ui_right") - Input.is_action_pressed("ui_left")
	if Input.is_action_pressed("ui_right"):
		acc.x += 1
	if Input.is_action_pressed("ui_left"):
		acc.x += -1
	
	acc.x *= ACCEL
	if acc.x == 0:
		acc.x = vel.x * FRICTION * delta
	vel += acc * delta
	vel.x = clamp(vel.x, -MAX_SPEED, MAX_SPEED)

	var motion = move_and_slide(vel * delta)
#	if is_colliding():
#		var n = get_collision_normal()
#		motion = n.slide(motion)
#		vel = n.slide(vel)
#		move(motion)
