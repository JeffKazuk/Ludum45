extends Spatial

var dialogue = preload ("res://dialogue/Dialogue.tscn")
var ins = dialogue.instance()
var scenechanger

# Called when the node enters the scene tree for the first time.
func _ready():
	scenechanger = get_parent().get_parent().get_node("changeScene")

func _on_interact():
	if GlobalVars.race_attempted == false:
		ins.file = "jogger1"
		add_child(ins)
	elif GlobalVars.race_attempted == true && GlobalVars.race_done == false:
		ins.file = "joggerrematch"
		add_child(ins)
