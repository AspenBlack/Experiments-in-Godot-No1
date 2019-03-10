extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var tempelapsed = 0
var frames = 0
var count = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	frames = get_vframes()*get_hframes()
	#print ("Frames" , frames)
	set_process(true)
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
	tempelapsed = tempelapsed + delta
	count = count + 1
	

	if (tempelapsed > 0.1):
		#print("test ",tempelapsed," ",count)
		if (get_frame()== frames-1):
			set_frame(0)
		else:
			set_frame(get_frame()+1)
		tempelapsed = 0
		count = 0
	pass
