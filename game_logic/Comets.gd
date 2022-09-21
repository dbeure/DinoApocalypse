extends RigidBody2D


export var min_speed = 150
export var max_speed = 250

onready var glob_var = get_node("/root/Global")

#func _ready():
#	$AnimatedSprite.playing = true
#	connect("body_entered",self, "on_RigidBody2D_body_entered")

func _ready():
	$AnimatedSprite.playing = true
	connect("body_entered",self, "destroy")
	
func destroy(body):
	var collider = body.get_parent()
	var nameOfCollider = collider.get_name()
	if nameOfCollider == "MainScene":
		glob_var.game_over = true
		queue_free()
	else:
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()



#func _process(delta:
#	if(is_colliding()):
#         if(get_collider() == get_node("enemy")):
#			hide()

#
#func _on_Comets_body_entered(body):
#	queue_free()


