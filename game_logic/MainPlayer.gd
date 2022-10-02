extends KinematicBody2D

var score : int = 0

var speed : int = 200
var jumpForce : int = 500
var gravity : int = 800
var body_entered : int = 0

var vel : Vector2 = Vector2()

onready var sprite : Sprite = get_node("MainPlayer")
onready var glob_var = get_node("/root/Global")


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
		
	if self.position.y > 1000:
		glob_var.game_over = true
		
	if self.position.x < -7120:
		glob_var.win = true
	
	#var collision = move_and_collide((vel/2) * delta)
	#if collision:
	#	print("I collided with ", collision.collider.name)
	#THIS ABOVE DOES NOT WORK BECAUSE ONLY ACTIVE COLLISIONS from the player


func _on_Area2D_body_entered(_body):
	#glob_var.game_over = true
	body_entered += 1
	print(body_entered)
	if body_entered == 2:
		print("Game Over")
		glob_var.game_over = true
