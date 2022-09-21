extends Area2D


var speed : int = 200
var jumpForce : int = 500

var vel : Vector2 = Vector2()




# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _physics_process(delta):
	vel.x = 0
	
	#movement inputs
	if Input.is_action_pressed("move_left"):
		vel.x-=speed
		$AnimatedSprite.flip_h=false
		$AnimatedSprite.playing = true
		
	elif Input.is_action_pressed("move_right"):
		vel.x+=speed
		$AnimatedSprite.flip_h=true
		$AnimatedSprite.playing = true
	
	else:
		$AnimatedSprite.playing = false
	
	#applying velocity
	#vel = move_and_slide(vel, Vector2.UP)
	
	#gravity
	vel.y += gravity*delta
	
	#jump input (can't jump from in the air!)
	if Input.is_action_pressed("jump"):
		vel.y-=jumpForce


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
