extends Spatial

var game

func _ready():
	game = get_parent().get_parent()

func _on_interact():
	game.hand_in()