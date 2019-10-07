extends Spatial

var dialogue = preload("res://dialogue/Dialogue.tscn")
var ins = dialogue.instance()
var scene_changer
# Called when the node enters the scene tree for the first time.
func _ready():
	scene_changer = get_parent().get_parent().get_node("changeScene")

func _on_interact():
	if GlobalVars.borgors_attempted == false:
		scene_changer.nextLevel = "Kitchen"
		scene_changer.location = "Restaurant"
		ins.file = "chef1"
		add_child(ins)
		
	elif GlobalVars.borgors_attempted == true && GlobalVars.borgers_done == false:
		scene_changer.nextLevel = "Kitchen"
		scene_changer.location = "Restaurant"
		ins.file = "chefrematch"
		add_child(ins)
