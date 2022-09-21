extends Node2D

export(PackedScene) var comets_scene

onready var glob_var = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	#$CanvasLayer.hide()


func _on_CometTimer_timeout():
	if glob_var.game_over == true:
		self.hide()
		$CanvasLayer.show()
		print(glob_var.game_over)
	
	var comet_spawn_location = $CometPath/CometSpawnLocation
	comet_spawn_location.unit_offset = randf()
	
	var comet = comets_scene.instance()
	
	add_child(comet)
	
	comet.position = comet_spawn_location.position
	
	var direction = comet_spawn_location.rotation + 90
	direction += rand_range(0, PI/4)
	comet.rotation = direction
	
	var velocity = Vector2(rand_range(comet.min_speed, comet.max_speed), 0)
	comet.linear_velocity = velocity.rotated(direction)


func _on_CanvasLayer_start_game():
	glob_var.game_over = false
	$CanvasLayer.hide()
	self.show()

