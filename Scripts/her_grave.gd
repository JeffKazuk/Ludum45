extends Spatial

var dialogue = preload("res://dialogue/EndDialogue.tscn")
var ins = dialogue.instance()

func _on_interact():
	ins.file = "finale"
	add_child(ins)