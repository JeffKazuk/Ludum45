extends Spatial
var GlobalVars
# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.get_name())
	GlobalVars = get_node("/root/GlobalVars")

func _on_interact():
	if GlobalVars.mail_started:
		GlobalVars.mail_deliveries[get_name()] = true
	print(GlobalVars.mail_deliveries[get_name()])
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
