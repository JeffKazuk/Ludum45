extends Spatial

var chefshack
var object_is_there = true
signal pickup

func _ready():
	chefshack = get_parent().get_parent()
	self.connect("pickup", chefshack, "_pickup", [get_name()])

func _on_interact():
	if object_is_there:
		$Object.visible = false
		emit_signal("pickup")
		object_is_there = false

func reset():
	$Object.visible = true
	object_is_there = true

