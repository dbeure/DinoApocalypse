extends Node2D

export(PackedScene) var comets_scene

onready var glob_var = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


func _on_CometTimer_timeout():
	if glob_var.game_over == true:
		self.hide()
		$CometTimer.stop()
		$CanvasLayer.show()
		print(glob_var.game_over)
		
	if glob_var.win == true:
		self.hide()
		$CometTimer.stop()
		$Win.show()
	
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
	print("Start game")
	glob_var.game_over = false
	$CanvasLayer.hide()
	$Win.hide()
	self.show()
	$MainPlayer.position.x = 950
	$MainPlayer.position.y = 160
	$MainPlayer.body_entered = 0
	$CometTimer.start()

