extends CanvasLayer

onready var glob_var = get_node("/root/Global")

signal start_game

func _on_Button_pressed():
	emit_signal("start_game")

func game_won():
	if glob_var.win == true:
		self.show()
