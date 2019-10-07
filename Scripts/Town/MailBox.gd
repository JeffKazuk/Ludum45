extends Spatial
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_interact():
	if GlobalVars.mail_started:
		$MailBox.play()
		GlobalVars.mail_deliveries[get_name()] = true