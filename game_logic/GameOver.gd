extends CanvasLayer

signal start_game

onready var comets = $Comets

func _on_Button_pressed():
	emit_signal("start_game")

func game_over():
	if comets.game_over == true:
		self.show()
