extends KinematicBody2D

var score : int = 0

var speed : int = 200
var jumpForce : int = 500
var gravity : int = 800

var vel : Vector2 = Vector2()

onready var sprite : Sprite = get_node("MainPlayer")

signal game_over

func _physics_process(delta):
	vel.x = 0
	
	#movement inputs
	if Input.is_action_pressed("move_left"):
		vel.x-=speed
		sprite.flip_h=false
		$AnimationPlayer.play("Walk")
		
	elif Input.is_action_pressed("move_right"):
		vel.x+=speed
		sprite.flip_h=true
		$AnimationPlayer.play("Walk")
	
	else:
		$AnimationPlayer.stop()
	
	#applying velocity
	vel = move_and_slide(vel, Vector2.UP)
	
	#gravity
	vel.y += gravity*delta
	
	#jump input (can't jump from in the air!)
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y-=jumpForce
	
	#var collision = move_and_collide(Vector2())
	#if collision:
	#	print("I collided with ", collision.collider.name)
	#THIS ABOVE DOES NOT WORK BECAUSE ONLY ACTIVE COLLISIONS

