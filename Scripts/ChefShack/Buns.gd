extends Spatial

var chefshack
signal pickup

func _ready():
	chefshack = get_parent().get_parent()
	self.connect("pickup", chefshack, "_pickup", ["Bun"])

func _on_interact():
	
	emit_signal("pickup")