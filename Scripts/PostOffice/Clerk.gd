extends Spatial
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dialogue = preload ("res://dialogue/Dialogue.tscn")
var ins = dialogue.instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_interact():
	GlobalVars.mail_started = true
	ins.file = "post1"
	add_child(ins)
