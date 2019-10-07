extends Spatial

var dialogue = preload("res://dialogue/Dialogue.tscn")
var ins = dialogue.instance()
var scene_changer
# Called when the node enters the scene tree for the first time.
func _ready():
	scene_changer = get_parent().get_parent().get_node("changeScene")

func _on_interact():
	if GlobalVars.pop_fly_attempted == false:
		scene_changer.nextLevel = "Ballgame"
		scene_changer.location = "Game_Spawn"
		ins.file = "kid1"
		add_child(ins)
		
	elif GlobalVars.pop_fly_attempted == true && GlobalVars.pop_fly_done == false:
		scene_changer.nextLevel = "Ballgame"
		scene_changer.location = "Game_Spawn"
		ins.file = "kiderematch"
		add_child(ins)
